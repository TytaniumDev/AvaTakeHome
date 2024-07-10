import 'package:ava_take_home/components/credit_score_header/credit_score_header_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_score_header_view_model.g.dart';

@riverpod
class CreditScoreHeaderViewModel extends _$CreditScoreHeaderViewModel {
  @override
  CreditScoreHeaderViewData build() {
    // TODO grab this from repo
    return const CreditScoreHeaderViewData(
      updatedDate: 'Updated Today | Next May 12',
      creditScore: 720,
      creditScoreRating: CreditScoreRating.good,
      creditScoreChange: 2,
      creditProvider: 'Experian',
    );
  }
}
