import 'package:ava_take_home/components/total_balance_card/total_balance_card_view.dart';
import 'package:ava_take_home/repository/credit_card_account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_balance_card_view_model.g.dart';

@riverpod
class TotalBalanceCardViewModel extends _$TotalBalanceCardViewModel {
  @override
  TotalBalanceCardViewData build() {
    final model = ref.watch(creditCardAccountRepositoryProvider);

    final totalBalance =
        model.fold(0, (total, account) => total + account.balance);
    final totalLimit = model.fold(0, (total, account) => total + account.limit);

    return TotalBalanceCardViewData(
      totalBalance: totalBalance.toInt(),
      totalLimit: totalLimit.toInt(),
      utilization: ((totalBalance / totalLimit) * 100).floor(),
    );
  }
}
