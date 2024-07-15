import 'package:ava_take_home/components/credit_score_chart_card/credit_score_chart_card_view.dart';
import 'package:ava_take_home/repository/credit_score_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_score_chart_card_view_model.g.dart';

@riverpod
class CreditScoreChartCardViewModel extends _$CreditScoreChartCardViewModel {
  @override
  CreditScoreChartCardViewData build() {
    final creditScores = ref.watch(creditScoresForLastTwelveMonthsProvider);

    return CreditScoreChartCardViewData(
      scorePerMonthForLastTwelveMonths: creditScores.reversed
          .map(
            (creditScore) => CreditScoreDataPoint(
              creditScore: creditScore.currentScore,
              date: creditScore.lastUpdatedDate,
            ),
          )
          .toList(),
    );
  }
}
