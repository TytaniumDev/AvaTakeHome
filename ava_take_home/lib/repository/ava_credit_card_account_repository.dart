import 'dart:async';
import 'dart:math';

import 'package:ava_take_home/demo_mode.dart';
import 'package:ava_take_home/model/ava_credit_card_account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ava_credit_card_account_repository.g.dart';

@riverpod
class AvaCreditCardAccountRepository extends _$AvaCreditCardAccountRepository {
  Timer? _timer;

  @override
  AvaCreditCardAccount build() {
    final demoModeEnabled = ref.watch(demoModeProvider);

    if (demoModeEnabled) {
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        state = generateRandomAccount();
      });
    } else {
      _timer?.cancel();
    }

    return AvaCreditCardAccount(
      balance: 25,
      creditLimit: 300,
      spendLimit: 100,
    );
  }

  AvaCreditCardAccount generateRandomAccount() {
    final random = Random();
    final balance = 10 + random.nextInt(200).roundToTens();
    final creditLimit = (balance + random.nextInt(1000)).roundToTens();
    final spendLimit = (balance + random.nextInt(creditLimit)).roundToTens();

    return AvaCreditCardAccount(
      balance: balance,
      creditLimit: creditLimit,
      spendLimit: spendLimit,
    );
  }
}

extension on int {
  /// Rounds the integer to the nearest 10 (aka 0 in the ones place).
  int roundToTens() {
    return ((this / 10).round()) * 10;
  }
}
