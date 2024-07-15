import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_account.freezed.dart';

@freezed
class CreditCardAccount with _$CreditCardAccount {
  factory CreditCardAccount({
    required String name,
    /// Should theoretically be in a generic currency format? Or establish
    /// the currency this is in with the server and add another field for it.
    required int balance,
    required int limit,
    required DateTime reportedOnDate,
  }) = _CreditCardAccount;
}
