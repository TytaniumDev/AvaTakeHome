// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ava_credit_card_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvaCreditCardAccount {
  int get balance => throw _privateConstructorUsedError;
  int get creditLimit => throw _privateConstructorUsedError;
  int get spendLimit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvaCreditCardAccountCopyWith<AvaCreditCardAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvaCreditCardAccountCopyWith<$Res> {
  factory $AvaCreditCardAccountCopyWith(AvaCreditCardAccount value,
          $Res Function(AvaCreditCardAccount) then) =
      _$AvaCreditCardAccountCopyWithImpl<$Res, AvaCreditCardAccount>;
  @useResult
  $Res call({int balance, int creditLimit, int spendLimit});
}

/// @nodoc
class _$AvaCreditCardAccountCopyWithImpl<$Res,
        $Val extends AvaCreditCardAccount>
    implements $AvaCreditCardAccountCopyWith<$Res> {
  _$AvaCreditCardAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? creditLimit = null,
    Object? spendLimit = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as int,
      spendLimit: null == spendLimit
          ? _value.spendLimit
          : spendLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvaCreditCardAccountImplCopyWith<$Res>
    implements $AvaCreditCardAccountCopyWith<$Res> {
  factory _$$AvaCreditCardAccountImplCopyWith(_$AvaCreditCardAccountImpl value,
          $Res Function(_$AvaCreditCardAccountImpl) then) =
      __$$AvaCreditCardAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int balance, int creditLimit, int spendLimit});
}

/// @nodoc
class __$$AvaCreditCardAccountImplCopyWithImpl<$Res>
    extends _$AvaCreditCardAccountCopyWithImpl<$Res, _$AvaCreditCardAccountImpl>
    implements _$$AvaCreditCardAccountImplCopyWith<$Res> {
  __$$AvaCreditCardAccountImplCopyWithImpl(_$AvaCreditCardAccountImpl _value,
      $Res Function(_$AvaCreditCardAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? creditLimit = null,
    Object? spendLimit = null,
  }) {
    return _then(_$AvaCreditCardAccountImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as int,
      spendLimit: null == spendLimit
          ? _value.spendLimit
          : spendLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AvaCreditCardAccountImpl implements _AvaCreditCardAccount {
  _$AvaCreditCardAccountImpl(
      {required this.balance,
      required this.creditLimit,
      required this.spendLimit});

  @override
  final int balance;
  @override
  final int creditLimit;
  @override
  final int spendLimit;

  @override
  String toString() {
    return 'AvaCreditCardAccount(balance: $balance, creditLimit: $creditLimit, spendLimit: $spendLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvaCreditCardAccountImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.spendLimit, spendLimit) ||
                other.spendLimit == spendLimit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, balance, creditLimit, spendLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvaCreditCardAccountImplCopyWith<_$AvaCreditCardAccountImpl>
      get copyWith =>
          __$$AvaCreditCardAccountImplCopyWithImpl<_$AvaCreditCardAccountImpl>(
              this, _$identity);
}

abstract class _AvaCreditCardAccount implements AvaCreditCardAccount {
  factory _AvaCreditCardAccount(
      {required final int balance,
      required final int creditLimit,
      required final int spendLimit}) = _$AvaCreditCardAccountImpl;

  @override
  int get balance;
  @override
  int get creditLimit;
  @override
  int get spendLimit;
  @override
  @JsonKey(ignore: true)
  _$$AvaCreditCardAccountImplCopyWith<_$AvaCreditCardAccountImpl>
      get copyWith => throw _privateConstructorUsedError;
}
