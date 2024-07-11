import 'package:ava_take_home/components/credit_score_header/credit_score_header_view.dart';
import 'package:ava_take_home/model/credit_score_rating.dart';
import 'package:ava_take_home/repository/credit_score_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_score_header_view_model.g.dart';

@riverpod
class CreditScoreHeaderViewModel extends _$CreditScoreHeaderViewModel {
  @override
  CreditScoreHeaderViewData build() {
    final creditScoreModel = ref.watch(currentCreditScoreModelProvider);

    return CreditScoreHeaderViewData(
      updatedDate: 'Updated Today | Next May 12',
      creditScore: creditScoreModel.currentScore,
      creditScoreRating:
          CreditScoreRating.fromCreditScore(creditScoreModel.currentScore),
      creditScoreChange: 2,
      creditProvider: 'Experian',
    );
  }


}
