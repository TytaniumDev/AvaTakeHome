import 'package:ava_take_home/model/credit_card_account.dart';
import 'package:jiffy/jiffy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_card_account_repository.g.dart';

@riverpod
class CreditCardAccountRepository extends _$CreditCardAccountRepository {
  @override
  List<CreditCardAccount> build() {
    return ref.watch(demoCreditCardAccountsProvider);
  }
}

@riverpod
class DemoCreditCardAccounts extends _$DemoCreditCardAccounts {
  @override
  List<CreditCardAccount> build() {
    return [
      CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        utilization: 21,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
      CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        utilization: 21,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
      CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        utilization: 21,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
    ];
  }
}
