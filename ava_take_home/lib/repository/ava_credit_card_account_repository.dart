import 'package:ava_take_home/model/ava_credit_card_account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ava_credit_card_account_repository.g.dart';

@riverpod
class AvaCreditCardAccountRepository extends _$AvaCreditCardAccountRepository {
  @override
  AvaCreditCardAccount build() {
    return AvaCreditCardAccount(
      balance: 25,
      creditLimit: 600,
      spendLimit: 100,
    );
  }
}
