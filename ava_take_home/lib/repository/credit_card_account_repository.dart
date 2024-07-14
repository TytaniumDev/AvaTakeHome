import 'package:ava_take_home/model/credit_card_account.dart';
import 'package:jiffy/jiffy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_card_account_repository.g.dart';

const _avaAccountId = 'avaAccountUniqueId';

@riverpod
avaCreditCardAccountModel(AvaCreditCardAccountModelRef ref) {
  return ref.watch(
    demoCreditCardAccountsProvider.select(
      (models) => models[_avaAccountId],
    ),
  );
}

@riverpod
nonAvaCreditCardAccountModels(NonAvaCreditCardAccountModelsRef ref) {
  return ref.watch(
    demoCreditCardAccountsProvider.select(
      (models) => models..remove(_avaAccountId),
    ),
  );
}

@riverpod
class DemoCreditCardAccounts extends _$DemoCreditCardAccounts {
  @override
  Map<String, CreditCardAccount> build() {
    return {
      _avaAccountId: CreditCardAccount(
        name: 'Ava',
        balance: 30,
        limit: 600,
        utilization: 4,
        reportedOnDate: DateTime.now(),
      ),
      'amazonAccount1': CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        utilization: 21,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
      'amazonAccount2': CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        utilization: 21,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
      'amazonAccount3': CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        utilization: 21,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
    };
  }
}
