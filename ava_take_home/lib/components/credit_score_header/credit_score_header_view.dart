import 'package:ava_take_home/components/credit_score_header/credit_score_header_view_model.dart';
import 'package:ava_take_home/model/credit_score.dart';
import 'package:ava_take_home/model/credit_score_rating.dart';
import 'package:ava_take_home/ui/animation.dart';
import 'package:ava_take_home/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';

@immutable
class CreditScoreHeaderViewData {
  final DateTime updatedDate;
  final DateTime nextUpdateDate;
  final int creditScore;
  final CreditScoreRating creditScoreRating;
  final int creditScoreChange;
  final CreditProvider creditProvider;

  const CreditScoreHeaderViewData({
    required this.updatedDate,
    required this.nextUpdateDate,
    required this.creditScore,
    required this.creditScoreRating,
    required this.creditScoreChange,
    required this.creditProvider,
  });
}

class CreditScoreHeaderView extends ConsumerWidget {
  const CreditScoreHeaderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(creditScoreHeaderViewModelProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: homePageCardBoxDecoration(borderRadius: 20),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Credit Score',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _ScoreChangeChip(
                            scoreChange: viewData.creditScoreChange,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      AnimatedText(
                        'Updated ${Jiffy.parseFromDateTime(viewData.updatedDate).fromNow()}',
                        style: const TextStyle(
                          //TODO get color from theme
                          color: AppColors.textLight,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AnimatedText(
                        'Next ${Jiffy.parseFromDateTime(viewData.nextUpdateDate).format(pattern: 'MMM do')}',
                        style: const TextStyle(
                          //TODO get color from theme
                          color: AppColors.textLight,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  AnimatedText(
                    viewData.creditProvider.toDisplayString(),
                    style: const TextStyle(
                      color: AppColors.lightPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const _CreditScoreCircle(),
          ],
        ),
      ),
    );
  }
}

class _ScoreChangeChip extends StatelessWidget {
  final int scoreChange;

  const _ScoreChangeChip({required this.scoreChange});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: ShapeDecoration(
        color: scoreChange >= 0 ? AppColors.avaSecondary : AppColors.badRed,
        shape: const StadiumBorder(),
      ),
      child: AnimatedText(
        '${scoreChange >= 0 ? '+' : '-'}${scoreChange}pts',
        style: const TextStyle(
          // TODO: Get color from theme
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CreditScoreCircle extends ConsumerStatefulWidget {
  const _CreditScoreCircle();

  @override
  ConsumerState<_CreditScoreCircle> createState() => _CreditScoreCircleState();
}

class _CreditScoreCircleState extends ConsumerState<_CreditScoreCircle> {
  int? previousCreditScore;
  late int currentCreditScore;

  @override
  void initState() {
    super.initState();
    currentCreditScore = ref.read(
      creditScoreHeaderViewModelProvider
          .select((viewModel) => viewModel.creditScore),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
        creditScoreHeaderViewModelProvider.select(
          (viewModel) => viewModel.creditScore,
        ), (previousValue, newValue) {
      setState(() {
        previousCreditScore = previousValue;
        currentCreditScore = newValue;
      });
    });
    final creditScoreRating = ref.watch(
      creditScoreHeaderViewModelProvider
          .select((viewModel) => viewModel.creditScoreRating),
    );

    return Container(
      constraints: const BoxConstraints(
        minHeight: 72,
        minWidth: 72,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: SizedBox(
              height: 72,
              width: 72,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: _creditScorePercentage(
                    previousCreditScore ?? currentCreditScore,
                  ),
                  end: _creditScorePercentage(currentCreditScore),
                ),
                duration: animationDuration,
                curve: animationCurve,
                builder: (context, value, child) {
                  return CircularProgressIndicator(
                    key: const ValueKey('CreditScoreCircle'),
                    value: value,
                    strokeWidth: 6,
                    backgroundColor: AppColors.avaSecondaryLight,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.avaSecondary,
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
                '$currentCreditScore',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36,
                  fontFamily: 'At Slam Cnd',
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              AnimatedText(
                creditScoreRating.toDisplayString(),
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

  /// Determines what "percentage" of a maximum credit score the current
  /// [creditScore] is.
  double _creditScorePercentage(int creditScore) {
    const minCreditScore = CreditScore.min;
    const maxCreditScore = CreditScore.max;
    return (creditScore - minCreditScore) / (maxCreditScore - minCreditScore);
  }
}

extension on CreditScoreRating {
  String toDisplayString() {
    switch (this) {
      case CreditScoreRating.excellent:
        return 'Excellent';
      case CreditScoreRating.veryGood:
        return 'Very good';
      case CreditScoreRating.good:
        return 'Good';
      case CreditScoreRating.fair:
        return 'Fair';
      case CreditScoreRating.poor:
        return 'Poor';
    }
  }

  Color toActiveColor() {
    switch (this) {
      case CreditScoreRating.excellent:
        return AppColors.avaSecondary;
      case CreditScoreRating.veryGood:
        return AppColors.avaSecondary;
      case CreditScoreRating.good:
        return AppColors.avaSecondary;
      case CreditScoreRating.fair:
        return AppColors.okayOrange;
      case CreditScoreRating.poor:
        return AppColors.badRed;
    }
  }

  Color toInactiveColor() {
    switch (this) {
      case CreditScoreRating.excellent:
        return AppColors.avaSecondaryLight;
      case CreditScoreRating.veryGood:
        return AppColors.avaSecondaryLight;
      case CreditScoreRating.good:
        return AppColors.avaSecondaryLight;
      case CreditScoreRating.fair:
        return AppColors.okayOrangeLight;
      case CreditScoreRating.poor:
        return AppColors.badRedLight;
    }
  }
}

extension on CreditProvider {
  String toDisplayString() {
    switch (this) {
      case CreditProvider.equifax:
        return 'Equifax';
      case CreditProvider.transunion:
        return 'Transunion';
      case CreditProvider.experian:
        return 'Experian';
    }
  }
}
