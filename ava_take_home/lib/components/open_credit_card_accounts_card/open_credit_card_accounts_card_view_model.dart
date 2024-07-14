import 'package:ava_take_home/components/open_credit_card_accounts_card/open_credit_card_accounts_card_view.dart';
import 'package:ava_take_home/repository/credit_card_account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'open_credit_card_accounts_card_view_model.g.dart';

@riverpod
class OpenCreditCardAccountsCardViewModel
    extends _$OpenCreditCardAccountsCardViewModel {
  @override
  OpenCreditCardAccountsCardViewData build() {
    final accountsModel = ref.watch(creditCardAccountRepositoryProvider);
    return OpenCreditCardAccountsCardViewData(
      accounts: accountsModel.map((account) {
        return OpenCreditCardAccountViewData(
          name: account.name,
          balance: account.balance,
          limit: account.limit,
          utilization: account.utilization.ceil(),
          reportedOnDate: account.reportedOnDate,
        );
      }).toList(),
    );
  }
}
