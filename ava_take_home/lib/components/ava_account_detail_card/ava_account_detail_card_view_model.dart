import 'package:ava_take_home/components/ava_account_detail_card/ava_account_detail_card_view.dart';
import 'package:ava_take_home/repository/ava_credit_card_account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'ava_account_detail_card_view_model.g.dart';

@riverpod
class AvaAccountDetailCardViewModel extends _$AvaAccountDetailCardViewModel {
  @override
  AvaAccountDetailCardViewData build() {
    final model = ref.watch(avaCreditCardAccountRepositoryProvider);

    return AvaAccountDetailCardViewData(
      balance: model.balance,
      availableToSpend: model.spendLimit - model.balance,
      creditLimit: model.creditLimit,
      spendLimit: model.spendLimit,
      utilization: ((model.balance / model.creditLimit) * 100).toInt(),
    );
  }
}
