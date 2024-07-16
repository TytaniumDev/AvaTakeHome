import 'package:ava_take_home/components/credit_score_snippet/credit_score_snippet_view_model.dart';
import 'package:ava_take_home/model/credit_score.dart';
import 'package:ava_take_home/ui/animation.dart';
import 'package:ava_take_home/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';

part 'credit_score_snippet_view.freezed.dart';

@freezed
class CreditScoreSnippetViewData with _$CreditScoreSnippetViewData {
  factory CreditScoreSnippetViewData({
    required DateTime updatedDate,
    required DateTime nextUpdateDate,
    required int creditScoreChange,
    required CreditProvider creditProvider,
  }) = _CreditScoreSnippetViewData;
}

class CreditScoreSnippetView extends ConsumerWidget {
  const CreditScoreSnippetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(creditScoreSnippetViewModelProvider);

    return Column(
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
                color: AppColors.textLight,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            AnimatedText(
              'Next ${Jiffy.parseFromDateTime(viewData.nextUpdateDate).format(pattern: 'MMM do')}',
              style: const TextStyle(
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
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
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
