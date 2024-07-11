import 'package:ava_take_home/model/credit_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_score_respository.g.dart';

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
    return [
      CreditScore(
        currentScore: 720,
        lastUpdatedDate: DateTime.now(),
        nextUpdateDate: DateTime.now().add(const Duration(days: 2)),
        latestChange: 2,
        creditProvider: CreditProvider.experian,
      ),
    ];
  }
}
