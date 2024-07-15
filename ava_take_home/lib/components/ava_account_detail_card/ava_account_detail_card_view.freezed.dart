// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ava_account_detail_card_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvaAccountDetailCardViewData {
  int get balance => throw _privateConstructorUsedError;
  int get creditLimit => throw _privateConstructorUsedError;
  int get spendLimit => throw _privateConstructorUsedError;
  int get utilization => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvaAccountDetailCardViewDataCopyWith<AvaAccountDetailCardViewData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvaAccountDetailCardViewDataCopyWith<$Res> {
  factory $AvaAccountDetailCardViewDataCopyWith(
          AvaAccountDetailCardViewData value,
          $Res Function(AvaAccountDetailCardViewData) then) =
      _$AvaAccountDetailCardViewDataCopyWithImpl<$Res,
          AvaAccountDetailCardViewData>;
  @useResult
  $Res call({int balance, int creditLimit, int spendLimit, int utilization});
}

/// @nodoc
class _$AvaAccountDetailCardViewDataCopyWithImpl<$Res,
        $Val extends AvaAccountDetailCardViewData>
    implements $AvaAccountDetailCardViewDataCopyWith<$Res> {
  _$AvaAccountDetailCardViewDataCopyWithImpl(this._value, this._then);

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
    Object? utilization = null,
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
      utilization: null == utilization
          ? _value.utilization
          : utilization // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvaAccountDetailCardViewDataImplCopyWith<$Res>
    implements $AvaAccountDetailCardViewDataCopyWith<$Res> {
  factory _$$AvaAccountDetailCardViewDataImplCopyWith(
          _$AvaAccountDetailCardViewDataImpl value,
          $Res Function(_$AvaAccountDetailCardViewDataImpl) then) =
      __$$AvaAccountDetailCardViewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int balance, int creditLimit, int spendLimit, int utilization});
}

/// @nodoc
class __$$AvaAccountDetailCardViewDataImplCopyWithImpl<$Res>
    extends _$AvaAccountDetailCardViewDataCopyWithImpl<$Res,
        _$AvaAccountDetailCardViewDataImpl>
    implements _$$AvaAccountDetailCardViewDataImplCopyWith<$Res> {
  __$$AvaAccountDetailCardViewDataImplCopyWithImpl(
      _$AvaAccountDetailCardViewDataImpl _value,
      $Res Function(_$AvaAccountDetailCardViewDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? creditLimit = null,
    Object? spendLimit = null,
    Object? utilization = null,
  }) {
    return _then(_$AvaAccountDetailCardViewDataImpl(
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
      utilization: null == utilization
          ? _value.utilization
          : utilization // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AvaAccountDetailCardViewDataImpl
    implements _AvaAccountDetailCardViewData {
  _$AvaAccountDetailCardViewDataImpl(
      {required this.balance,
      required this.creditLimit,
      required this.spendLimit,
      required this.utilization});

  @override
  final int balance;
  @override
  final int creditLimit;
  @override
  final int spendLimit;
  @override
  final int utilization;

  @override
  String toString() {
    return 'AvaAccountDetailCardViewData(balance: $balance, creditLimit: $creditLimit, spendLimit: $spendLimit, utilization: $utilization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvaAccountDetailCardViewDataImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.spendLimit, spendLimit) ||
                other.spendLimit == spendLimit) &&
            (identical(other.utilization, utilization) ||
                other.utilization == utilization));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, balance, creditLimit, spendLimit, utilization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvaAccountDetailCardViewDataImplCopyWith<
          _$AvaAccountDetailCardViewDataImpl>
      get copyWith => __$$AvaAccountDetailCardViewDataImplCopyWithImpl<
          _$AvaAccountDetailCardViewDataImpl>(this, _$identity);
}

abstract class _AvaAccountDetailCardViewData
    implements AvaAccountDetailCardViewData {
  factory _AvaAccountDetailCardViewData(
      {required final int balance,
      required final int creditLimit,
      required final int spendLimit,
      required final int utilization}) = _$AvaAccountDetailCardViewDataImpl;

  @override
  int get balance;
  @override
  int get creditLimit;
  @override
  int get spendLimit;
  @override
  int get utilization;
  @override
  @JsonKey(ignore: true)
  _$$AvaAccountDetailCardViewDataImplCopyWith<
          _$AvaAccountDetailCardViewDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
