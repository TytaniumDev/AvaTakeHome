// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_balance_card_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TotalBalanceCardViewData {
  int get totalBalance => throw _privateConstructorUsedError;
  int get totalLimit => throw _privateConstructorUsedError;
  int get utilization => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TotalBalanceCardViewDataCopyWith<TotalBalanceCardViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalBalanceCardViewDataCopyWith<$Res> {
  factory $TotalBalanceCardViewDataCopyWith(TotalBalanceCardViewData value,
          $Res Function(TotalBalanceCardViewData) then) =
      _$TotalBalanceCardViewDataCopyWithImpl<$Res, TotalBalanceCardViewData>;
  @useResult
  $Res call({int totalBalance, int totalLimit, int utilization});
}

/// @nodoc
class _$TotalBalanceCardViewDataCopyWithImpl<$Res,
        $Val extends TotalBalanceCardViewData>
    implements $TotalBalanceCardViewDataCopyWith<$Res> {
  _$TotalBalanceCardViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? totalLimit = null,
    Object? utilization = null,
  }) {
    return _then(_value.copyWith(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      totalLimit: null == totalLimit
          ? _value.totalLimit
          : totalLimit // ignore: cast_nullable_to_non_nullable
              as int,
      utilization: null == utilization
          ? _value.utilization
          : utilization // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalBalanceCardViewDataImplCopyWith<$Res>
    implements $TotalBalanceCardViewDataCopyWith<$Res> {
  factory _$$TotalBalanceCardViewDataImplCopyWith(
          _$TotalBalanceCardViewDataImpl value,
          $Res Function(_$TotalBalanceCardViewDataImpl) then) =
      __$$TotalBalanceCardViewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalBalance, int totalLimit, int utilization});
}

/// @nodoc
class __$$TotalBalanceCardViewDataImplCopyWithImpl<$Res>
    extends _$TotalBalanceCardViewDataCopyWithImpl<$Res,
        _$TotalBalanceCardViewDataImpl>
    implements _$$TotalBalanceCardViewDataImplCopyWith<$Res> {
  __$$TotalBalanceCardViewDataImplCopyWithImpl(
      _$TotalBalanceCardViewDataImpl _value,
      $Res Function(_$TotalBalanceCardViewDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? totalLimit = null,
    Object? utilization = null,
  }) {
    return _then(_$TotalBalanceCardViewDataImpl(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      totalLimit: null == totalLimit
          ? _value.totalLimit
          : totalLimit // ignore: cast_nullable_to_non_nullable
              as int,
      utilization: null == utilization
          ? _value.utilization
          : utilization // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TotalBalanceCardViewDataImpl implements _TotalBalanceCardViewData {
  _$TotalBalanceCardViewDataImpl(
      {required this.totalBalance,
      required this.totalLimit,
      required this.utilization});

  @override
  final int totalBalance;
  @override
  final int totalLimit;
  @override
  final int utilization;

  @override
  String toString() {
    return 'TotalBalanceCardViewData(totalBalance: $totalBalance, totalLimit: $totalLimit, utilization: $utilization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalBalanceCardViewDataImpl &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.totalLimit, totalLimit) ||
                other.totalLimit == totalLimit) &&
            (identical(other.utilization, utilization) ||
                other.utilization == utilization));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalBalance, totalLimit, utilization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalBalanceCardViewDataImplCopyWith<_$TotalBalanceCardViewDataImpl>
      get copyWith => __$$TotalBalanceCardViewDataImplCopyWithImpl<
          _$TotalBalanceCardViewDataImpl>(this, _$identity);
}

abstract class _TotalBalanceCardViewData implements TotalBalanceCardViewData {
  factory _TotalBalanceCardViewData(
      {required final int totalBalance,
      required final int totalLimit,
      required final int utilization}) = _$TotalBalanceCardViewDataImpl;

  @override
  int get totalBalance;
  @override
  int get totalLimit;
  @override
  int get utilization;
  @override
  @JsonKey(ignore: true)
  _$$TotalBalanceCardViewDataImplCopyWith<_$TotalBalanceCardViewDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
