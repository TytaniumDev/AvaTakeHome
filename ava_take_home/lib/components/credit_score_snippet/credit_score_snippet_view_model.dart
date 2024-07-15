import 'package:ava_take_home/components/credit_score_snippet/credit_score_snippet_view.dart';
import 'package:ava_take_home/repository/credit_score_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_score_snippet_view_model.g.dart';

@riverpod
class CreditScoreSnippetViewModel extends _$CreditScoreSnippetViewModel {
  @override
  CreditScoreSnippetViewData build() {
    final creditScoreModel = ref.watch(currentCreditScoreModelProvider);

    return CreditScoreSnippetViewData(
      updatedDate: creditScoreModel.lastUpdatedDate,
      nextUpdateDate: creditScoreModel.nextUpdateDate,
      creditScoreChange: creditScoreModel.latestChange,
      creditProvider: creditScoreModel.creditProvider,
    );
  }
}
