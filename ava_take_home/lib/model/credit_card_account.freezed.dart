// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreditCardAccount {
  String get name => throw _privateConstructorUsedError;

  /// Should theoretically be in a generic currency format? Or establish
  /// the currency this is in with the server and add another field for it.
  int get balance => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  DateTime get reportedOnDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditCardAccountCopyWith<CreditCardAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardAccountCopyWith<$Res> {
  factory $CreditCardAccountCopyWith(
          CreditCardAccount value, $Res Function(CreditCardAccount) then) =
      _$CreditCardAccountCopyWithImpl<$Res, CreditCardAccount>;
  @useResult
  $Res call({String name, int balance, int limit, DateTime reportedOnDate});
}

/// @nodoc
class _$CreditCardAccountCopyWithImpl<$Res, $Val extends CreditCardAccount>
    implements $CreditCardAccountCopyWith<$Res> {
  _$CreditCardAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? limit = null,
    Object? reportedOnDate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      reportedOnDate: null == reportedOnDate
          ? _value.reportedOnDate
          : reportedOnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditCardAccountImplCopyWith<$Res>
    implements $CreditCardAccountCopyWith<$Res> {
  factory _$$CreditCardAccountImplCopyWith(_$CreditCardAccountImpl value,
          $Res Function(_$CreditCardAccountImpl) then) =
      __$$CreditCardAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int balance, int limit, DateTime reportedOnDate});
}

/// @nodoc
class __$$CreditCardAccountImplCopyWithImpl<$Res>
    extends _$CreditCardAccountCopyWithImpl<$Res, _$CreditCardAccountImpl>
    implements _$$CreditCardAccountImplCopyWith<$Res> {
  __$$CreditCardAccountImplCopyWithImpl(_$CreditCardAccountImpl _value,
      $Res Function(_$CreditCardAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? limit = null,
    Object? reportedOnDate = null,
  }) {
    return _then(_$CreditCardAccountImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      reportedOnDate: null == reportedOnDate
          ? _value.reportedOnDate
          : reportedOnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CreditCardAccountImpl implements _CreditCardAccount {
  _$CreditCardAccountImpl(
      {required this.name,
      required this.balance,
      required this.limit,
      required this.reportedOnDate});

  @override
  final String name;

  /// Should theoretically be in a generic currency format? Or establish
  /// the currency this is in with the server and add another field for it.
  @override
  final int balance;
  @override
  final int limit;
  @override
  final DateTime reportedOnDate;

  @override
  String toString() {
    return 'CreditCardAccount(name: $name, balance: $balance, limit: $limit, reportedOnDate: $reportedOnDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardAccountImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.reportedOnDate, reportedOnDate) ||
                other.reportedOnDate == reportedOnDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, balance, limit, reportedOnDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditCardAccountImplCopyWith<_$CreditCardAccountImpl> get copyWith =>
      __$$CreditCardAccountImplCopyWithImpl<_$CreditCardAccountImpl>(
          this, _$identity);
}

abstract class _CreditCardAccount implements CreditCardAccount {
  factory _CreditCardAccount(
      {required final String name,
      required final int balance,
      required final int limit,
      required final DateTime reportedOnDate}) = _$CreditCardAccountImpl;

  @override
  String get name;
  @override

  /// Should theoretically be in a generic currency format? Or establish
  /// the currency this is in with the server and add another field for it.
  int get balance;
  @override
  int get limit;
  @override
  DateTime get reportedOnDate;
  @override
  @JsonKey(ignore: true)
  _$$CreditCardAccountImplCopyWith<_$CreditCardAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
