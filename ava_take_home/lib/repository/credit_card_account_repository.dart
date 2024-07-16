import 'dart:async';
import 'dart:math';

import 'package:ava_take_home/demo_mode.dart';
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
  Timer? _timer;

  @override
  List<CreditCardAccount> build() {
    final demoModeEnabled = ref.watch(demoModeProvider);

    if (demoModeEnabled) {
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        state = generateRandomBalances();
      });
    } else {
      _timer?.cancel();
    }

    return [
      CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
      CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
      CreditCardAccount(
        name: 'Syncb/Amazon',
        balance: 1500,
        limit: 6300,
        reportedOnDate: Jiffy.parse('2023-06-20').dateTime,
      ),
      CreditCardAccount(
        name: 'Capital One',
        balance: 3890,
        limit: 182000,
        reportedOnDate: Jiffy.parse('2023-09-12').dateTime,
      ),
    ];
  }

  List<CreditCardAccount> generateRandomBalances() {
    return state.map((account) {
      return account.copyWith(
        balance: Random().nextInt(account.limit),
      );
    }).toList();
  }
}
