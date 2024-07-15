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

/// Provides the history of the credit scores over the last twelve months,
/// one per month, with the latest scores first.
///
/// This is 100% a shortcut for the demo, the real app wouldn't behave like
/// this. There would need to be another backend endpoint to retrieve this data,
/// or some advanced filtering client side if we do pull the full credit score
/// history.
///
/// Or the UI could be more dynamic. Lots of options!
@riverpod
List<CreditScore> creditScoresForLastTwelveMonths(
  CreditScoreHistoryModelRef ref,
) {
  return ref.watch(demoCreditScoresProvider)
    ..sort((a, b) => a.lastUpdatedDate.compareTo(b.lastUpdatedDate))
    ..take(12);
}

@riverpod
class DemoCreditScores extends _$DemoCreditScores {
  @override
  List<CreditScore> build() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      final lastCreditScore = state.first;
      state = demoData(generateNextDemoScore(lastCreditScore));
    });

    return demoData();
  }

  demoData([CreditScore? firstItem]) {
    return [
      if (firstItem != null) firstItem,
      CreditScore(
        currentScore: 720,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 1)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 700,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 100)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 675,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 120)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 650,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 140)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 655,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 160)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 650,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 180)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 660,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 200)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 645,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 220)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 650,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 240)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 640,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 260)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 600,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 280)),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
      CreditScore(
        currentScore: 630,
        lastUpdatedDate: DateTime.now().subtract(const Duration(days: 300)),
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
