import 'dart:math';

import 'package:ava_take_home/components/credit_score_chart_card/credit_score_chart_card_view_model.dart';
import 'package:ava_take_home/components/credit_score_snippet/credit_score_snippet_view.dart';
import 'package:ava_take_home/model/credit_score.dart';
import 'package:ava_take_home/ui/animation.dart';
import 'package:ava_take_home/ui/theme.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_score_chart_card_view.freezed.dart';

@freezed
class CreditScoreChartCardViewData with _$CreditScoreChartCardViewData {
  factory CreditScoreChartCardViewData({
    required List<CreditScoreDataPoint> scorePerMonthForLastTwelveMonths,
  }) = _CreditScoreChartCardViewData;
}

@freezed
class CreditScoreDataPoint with _$CreditScoreDataPoint {
  factory CreditScoreDataPoint({
    required int creditScore,
    required DateTime date,
  }) = _CreditScoreDataPoint;
}

class CreditScoreChartCardView extends StatelessWidget {
  const CreditScoreChartCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: homePageCardBoxDecoration(),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CreditScoreSnippetView(),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              return _Chart(width: constraints.maxWidth);
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Last 12 months',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.12,
            ),
          ),
          const Text(
            'Score calculated using VantageScore 3.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.12,
            ),
          ),
        ],
      ),
    );
  }
}

/// Shows a chart of the user's credit score history over the past 12 months.
///
/// Shows a horizontal line on every 50 score, to match the example spec.
/// There are lots of options of how to show these lines, but for now it's
/// a strict every 50 credit score.
class _Chart extends ConsumerWidget {
  /// Horizontal lines will appear at every 50 credit score mark.
  static const _horizontalLineInterval = 50.0;

  final double width;

  const _Chart({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Need to reverse the data, because the most recent comes first from the
    // viewModel, and our chart widget expects the oldest score first instead.
    final viewData = ref
        .watch(
          creditScoreChartCardViewModelProvider.select(
            (viewModel) => viewModel.scorePerMonthForLastTwelveMonths,
          ),
        )
        .reversed;

    final minValue = viewData.fold(
      CreditScore.max,
      (int smallest, data) => min(smallest, data.creditScore),
    );

    final maxValue = viewData.fold(
      CreditScore.min,
      (int largest, data) => max(largest, data.creditScore),
    );

    // The max value rounded up to the nearest __0 so the chart looks
    // nice, while still being under the max/over the min credit score.
    final chartMaxValue = min(CreditScore.max, (maxValue / 10).ceil() * 10);
    final chartMinValue = max(CreditScore.min, (minValue / 10).floor() * 10);

    return SizedBox(
      height: 80,
      width: width,
      child: LineChart(
        duration: animationDuration,
        curve: animationCurve,
        LineChartData(
          minX: 0 /* 12 months ago, zero-indexed */,
          maxX: 11 /* Current score, zero-indexed */,
          maxY: chartMaxValue.toDouble(),
          minY: chartMinValue.toDouble(),
          borderData: FlBorderData(
            show: true,
            border: Border(
              top: chartMaxValue % _horizontalLineInterval == 0
                  ? const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    )
                  : BorderSide.none,
              bottom: chartMinValue % _horizontalLineInterval == 0
                  ? const BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
          ),
          lineTouchData: const LineTouchData(enabled: false),
          titlesData: FlTitlesData(
            bottomTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: _horizontalLineInterval,
                getTitlesWidget: (value, meta) {
                  if (value % _horizontalLineInterval == 0) {
                    return Text(
                      value.floor().toString(),
                      style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
          gridData: FlGridData(
            drawHorizontalLine: true,
            horizontalInterval: _horizontalLineInterval,
            checkToShowHorizontalLine: (value) =>
                value % _horizontalLineInterval == 0,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: AppColors.borderColor,
                strokeWidth: 1,
              );
            },
            drawVerticalLine: false,
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: false,
              color: AppColors.avaSecondary,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 2,
                    color: AppColors.backgroundWhite,
                    strokeColor: AppColors.avaSecondary,
                    strokeWidth: 2,
                  );
                },
              ),
              belowBarData: BarAreaData(show: false),
              spots: viewData
                  .mapIndexed(
                    (index, creditScore) => FlSpot(
                      index.toDouble(),
                      creditScore.creditScore.toDouble(),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
