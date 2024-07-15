import 'package:ava_take_home/components/credit_score_chart_card/credit_score_chart_card_view_model.dart';
import 'package:ava_take_home/components/credit_score_snippet/credit_score_snippet_view.dart';
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

class CreditScoreChartCardView extends ConsumerWidget {
  const CreditScoreChartCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(creditScoreChartCardViewModelProvider);

    return Container(
      decoration: homePageCardBoxDecoration(),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CreditScoreSnippetView(),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            width: 300,
            child: LineChart(
              duration: animationDuration,
              curve: animationCurve,
              LineChartData(
                titlesData: const FlTitlesData(
                  bottomTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: AppColors.avaSecondary,
                    barWidth: 1,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    spots: viewData.scorePerMonthForLastTwelveMonths
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
          ),
          const SizedBox(height: 8),
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
