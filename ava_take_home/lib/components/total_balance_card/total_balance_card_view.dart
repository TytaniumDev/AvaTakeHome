import 'package:ava_take_home/components/total_balance_card/total_balance_card_view_model.dart';
import 'package:ava_take_home/ui/animation.dart';
import 'package:ava_take_home/ui/theme.dart';
import 'package:ava_take_home/ui/utilization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math.dart' as math;

part 'total_balance_card_view.freezed.dart';

@freezed
class TotalBalanceCardViewData with _$TotalBalanceCardViewData {
  factory TotalBalanceCardViewData({
    required int totalBalance,
    required int totalLimit,
    required int utilization,
  }) = _TotalBalanceCardViewData;
}

class TotalBalanceCardView extends ConsumerWidget {
  const TotalBalanceCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(totalBalanceCardViewModelProvider);
    final currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

    return Container(
      decoration: homePageCardBoxDecoration(),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Total balance: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AnimatedText(
                        currencyFormat.format(viewData.totalBalance),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: AppColors.avaSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  AnimatedText(
                    'Total limit: ${currencyFormat.format(viewData.totalLimit)}',
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const _UtilizationCircle(),
            ],
          ),
          const SizedBox(height: 12),
          _UtilizationBar(
            utilizationPercent: viewData.utilization,
          ),
        ],
      ),
    );
  }
}

class _UtilizationCircle extends ConsumerStatefulWidget {
  const _UtilizationCircle();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UtilizationCircleState();
}

class _UtilizationCircleState extends ConsumerState<_UtilizationCircle> {
  int? previousUtilizationPercent;
  late int currentUtilizationPercent;

  @override
  void initState() {
    super.initState();
    currentUtilizationPercent = ref.read(
      totalBalanceCardViewModelProvider
          .select((viewModel) => viewModel.utilization),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
        totalBalanceCardViewModelProvider.select(
          (viewModel) => viewModel.utilization,
        ), (previousValue, newValue) {
      setState(() {
        previousUtilizationPercent = previousValue;
        currentUtilizationPercent = newValue;
      });
    });

    final currentUtilization =
        Utilization.fromPercentInt(currentUtilizationPercent);

    return Container(
      constraints: const BoxConstraints(
        minHeight: 72,
        minWidth: 72,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: math.radians(10),
            child: SizedBox(
              height: 72,
              width: 72,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin:
                      (previousUtilizationPercent ?? currentUtilizationPercent)
                          .toDouble(),
                  end: currentUtilizationPercent.toDouble(),
                ),
                duration: animationDuration,
                curve: animationCurve,
                builder: (context, value, child) {
                  return CircularProgressIndicator(
                    key: const ValueKey('UtilizationCircle'),
                    value: value / 100,
                    strokeWidth: 6,
                    backgroundColor: currentUtilization.inactiveColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      currentUtilization.displayColor,
                    ),
                  );
                },
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedText(
                '$currentUtilizationPercent%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36,
                  fontFamily: 'At Slam Cnd',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              AnimatedText(
                currentUtilization.displayName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UtilizationBar extends StatelessWidget {
  static const barRadius = Radius.circular(4.0);

  final int utilizationPercent;

  const _UtilizationBar({required this.utilizationPercent});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 80),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _UtilizationBarSection(
              section: Utilization.low,
              utilizationPercent: utilizationPercent,
              borderRadius: const BorderRadius.only(
                topLeft: barRadius,
                bottomLeft: barRadius,
              ),
              showStartTick: true,
              showEndTick: true,
              rangeTexts: [
                _UtilizationBarSectionRangeText(
                  min: 0,
                  max: 9,
                  section: Utilization.low,
                  utilizationPercent: utilizationPercent,
                  alignment: _UtilizationBarSectionAlignment.start,
                ),
                const Spacer(),
                _UtilizationBarSectionRangeText(
                  min: 10,
                  max: 29,
                  section: Utilization.low,
                  utilizationPercent: utilizationPercent,
                  alignment: _UtilizationBarSectionAlignment.end,
                ),
              ],
            ),
          ),
          Expanded(
            child: _UtilizationBarSection(
              section: Utilization.medium,
              utilizationPercent: utilizationPercent,
              showCenterTick: true,
              rangeTexts: [
                _UtilizationBarSectionRangeText(
                  min: 30,
                  max: 49,
                  section: Utilization.medium,
                  utilizationPercent: utilizationPercent,
                  alignment: _UtilizationBarSectionAlignment.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: _UtilizationBarSection(
              section: Utilization.high,
              utilizationPercent: utilizationPercent,
              borderRadius: const BorderRadius.only(
                topRight: barRadius,
                bottomRight: barRadius,
              ),
              showStartTick: true,
              showEndTick: true,
              rangeTexts: [
                _UtilizationBarSectionRangeText(
                  min: 50,
                  max: 74,
                  section: Utilization.high,
                  utilizationPercent: utilizationPercent,
                  alignment: _UtilizationBarSectionAlignment.start,
                ),
                const Spacer(),
                _UtilizationBarSectionRangeText(
                  min: 75,
                  max: 100,
                  section: Utilization.high,
                  utilizationPercent: utilizationPercent,
                  lastSection: true,
                  alignment: _UtilizationBarSectionAlignment.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A section of the [_UtilizationBar] in charge of rending a specific
/// section of the [Utilization] range.
class _UtilizationBarSection extends StatelessWidget {
  final Utilization section;
  final int utilizationPercent;

  final BorderRadiusGeometry borderRadius;

  final bool showStartTick;
  final bool showCenterTick;
  final bool showEndTick;

  final List<Widget> rangeTexts;

  const _UtilizationBarSection({
    required this.section,
    required this.utilizationPercent,
    this.borderRadius = BorderRadius.zero,
    this.showStartTick = false,
    this.showCenterTick = false,
    this.showEndTick = false,
    required this.rangeTexts,
  });

  @override
  Widget build(BuildContext context) {
    final currentUtilization = Utilization.fromPercentInt(utilizationPercent);

    return Column(
      children: [
        AnimatedOpacity(
          opacity: section == currentUtilization ? 1.0 : 0.0,
          duration: animationDuration,
          child: Text(
            section.displayName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: section.displayColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.12,
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: animationDuration,
          height: 24,
          decoration: BoxDecoration(
            color: section == currentUtilization
                ? section.displayColor
                : section.inactiveColor,
            borderRadius: borderRadius,
          ),
        ),
        const SizedBox(height: 4),
        const ExcludeSemantics(
          child: Row(
            children: [],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rangeTexts,
        ),
      ],
    );
  }
}

enum _UtilizationBarSectionAlignment {
  start,
  center,
  end;

  AlignmentGeometry toTickAlignment() {
    switch (this) {
      case _UtilizationBarSectionAlignment.start:
        return AlignmentDirectional.topStart;
      case _UtilizationBarSectionAlignment.center:
        return AlignmentDirectional.topCenter;
      case _UtilizationBarSectionAlignment.end:
        return AlignmentDirectional.topEnd;
    }
  }

  TextAlign toTextAlign() {
    switch (this) {
      case _UtilizationBarSectionAlignment.start:
        return TextAlign.start;
      case _UtilizationBarSectionAlignment.center:
        return TextAlign.center;
      case _UtilizationBarSectionAlignment.end:
        return TextAlign.end;
    }
  }
}

class _UtilizationBarSectionRangeText extends StatelessWidget {
  final int min;
  final int max;
  final Utilization section;
  final int utilizationPercent;
  final bool lastSection;
  final _UtilizationBarSectionAlignment alignment;

  const _UtilizationBarSectionRangeText({
    required this.min,
    required this.max,
    required this.section,
    required this.utilizationPercent,
    required this.alignment,
    this.lastSection = false,
  });

  @override
  Widget build(BuildContext context) {
    final utilizationWithinRange =
        utilizationPercent >= min && utilizationPercent <= max;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 1, maxWidth: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: alignment.toTickAlignment(),
            child: ExcludeSemantics(
              child: Container(
                height: 8,
                width: 1,
                decoration: BoxDecoration(
                  color: utilizationWithinRange
                      ? section.displayColor
                      : AppColors.borderColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            lastSection ? '<$min%' : '$min-$max%',
            maxLines: 1,
            overflow: TextOverflow.visible,
            textAlign: alignment.toTextAlign(),
            style: TextStyle(
              color: utilizationWithinRange
                  ? section.displayColor
                  : AppColors.textLight,
              fontSize: 12,
              fontWeight:
                  utilizationWithinRange ? FontWeight.w600 : FontWeight.w400,
              letterSpacing: 0.12,
            ),
          ),
        ],
      ),
    );
  }
}
