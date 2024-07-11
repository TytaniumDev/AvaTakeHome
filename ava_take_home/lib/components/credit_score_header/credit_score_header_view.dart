import 'package:ava_take_home/components/credit_score_header/credit_score_header_view_model.dart';
import 'package:ava_take_home/model/credit_score_rating.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class CreditScoreHeaderViewData {
  /// In real code this would go through a localization function.
  final String updatedDate;
  final int creditScore;
  final CreditScoreRating creditScoreRating;
  final int creditScoreChange;
  final String creditProvider;

  const CreditScoreHeaderViewData({
    required this.updatedDate,
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
      decoration: const ShapeDecoration(
        color: AppColors.backgroundWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
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
                              //TODO get color from theme
                              color: Color(0xFF2A1E39),
                              fontSize: 16,
                              fontFamily: 'At Hauss',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ScoreChangeChip(
                            scoreChange: viewData.creditScoreChange,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        viewData.updatedDate,
                        style: const TextStyle(
                          //TODO get color from theme
                          color: AppColors.textLight,
                          fontSize: 14,
                          fontFamily: 'At Hauss',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    viewData.creditProvider,
                    style: const TextStyle(
                      color: AppColors.lightPurple,
                      fontSize: 12,
                      fontFamily: 'At Hauss',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreChangeChip extends StatelessWidget {
  final int scoreChange;

  const ScoreChangeChip({super.key, required this.scoreChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: ShapeDecoration(
        color: scoreChange > 0 ? AppColors.avaSecondary : AppColors.badRed,
        shape: const StadiumBorder(),
      ),
      child: Text(
        '${scoreChange > 0 ? '+' : '-'}${scoreChange}pts',
        style: const TextStyle(
          // TODO: Get color from theme
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'At Hauss',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
