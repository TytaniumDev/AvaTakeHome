import 'dart:async';
import 'dart:math';

import 'package:ava_take_home/model/credit_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_score_repository.g.dart';

@riverpod
CreditScore currentCreditScoreModel(CurrentCreditScoreModelRef ref) {
  return ref
      .watch(creditScoreHistoryModelProvider.select((scores) => scores.first));
}

/// Provides the history of all credit scores for this user, sorted by
/// most recent first, oldest last.
@riverpod
List<CreditScore> creditScoreHistoryModel(CreditScoreHistoryModelRef ref) {
  return ref.watch(demoCreditScoresProvider)
    ..sort((a, b) => a.lastUpdatedDate.compareTo(b.lastUpdatedDate));
}

@riverpod
class DemoCreditScores extends _$DemoCreditScores {
  @override
  List<CreditScore> build() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      final lastCreditScore = state.first;
      state = [generateNextDemoScore(lastCreditScore), ...state]..removeLast();
    });

    return [
      CreditScore(
        currentScore: 720,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 1)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
    ];
  }

  CreditScore generateNextDemoScore(CreditScore lastCreditScore) {
    final creditScoreChange = Random().nextInt(50) - 25;
    final daysSinceUpdate = Duration(days: Random().nextInt(35));
    int nextScore = lastCreditScore.currentScore + creditScoreChange;
    if (nextScore < CreditScore.min) {
      nextScore = CreditScore.max - creditScoreChange;
    } else if (nextScore > CreditScore.max) {
      nextScore = CreditScore.min + creditScoreChange;
    }
    return lastCreditScore.copyWith(
      currentScore: nextScore,
      latestChange: creditScoreChange,
      lastUpdatedDate:
          lastCreditScore.lastUpdatedDate.subtract(daysSinceUpdate),
      nextUpdateDate: lastCreditScore.nextUpdateDate.add(daysSinceUpdate),
    );
  }
}
