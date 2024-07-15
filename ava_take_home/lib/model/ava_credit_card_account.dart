import 'package:freezed_annotation/freezed_annotation.dart';

part 'ava_credit_card_account.freezed.dart';

@freezed
class AvaCreditCardAccount with _$AvaCreditCardAccount {
  factory AvaCreditCardAccount({
    required int balance,
    required int creditLimit,
    required int spendLimit,
  }) = _AvaCreditCardAccount;
}
