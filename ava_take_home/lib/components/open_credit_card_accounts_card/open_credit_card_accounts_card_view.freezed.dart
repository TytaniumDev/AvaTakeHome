// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_credit_card_accounts_card_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OpenCreditCardAccountsCardViewData {
  List<OpenCreditCardAccountViewData> get accounts =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OpenCreditCardAccountsCardViewDataCopyWith<
          OpenCreditCardAccountsCardViewData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenCreditCardAccountsCardViewDataCopyWith<$Res> {
  factory $OpenCreditCardAccountsCardViewDataCopyWith(
          OpenCreditCardAccountsCardViewData value,
          $Res Function(OpenCreditCardAccountsCardViewData) then) =
      _$OpenCreditCardAccountsCardViewDataCopyWithImpl<$Res,
          OpenCreditCardAccountsCardViewData>;
  @useResult
  $Res call({List<OpenCreditCardAccountViewData> accounts});
}

/// @nodoc
class _$OpenCreditCardAccountsCardViewDataCopyWithImpl<$Res,
        $Val extends OpenCreditCardAccountsCardViewData>
    implements $OpenCreditCardAccountsCardViewDataCopyWith<$Res> {
  _$OpenCreditCardAccountsCardViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<OpenCreditCardAccountViewData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenCreditCardAccountsCardViewDataImplCopyWith<$Res>
    implements $OpenCreditCardAccountsCardViewDataCopyWith<$Res> {
  factory _$$OpenCreditCardAccountsCardViewDataImplCopyWith(
          _$OpenCreditCardAccountsCardViewDataImpl value,
          $Res Function(_$OpenCreditCardAccountsCardViewDataImpl) then) =
      __$$OpenCreditCardAccountsCardViewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OpenCreditCardAccountViewData> accounts});
}

/// @nodoc
class __$$OpenCreditCardAccountsCardViewDataImplCopyWithImpl<$Res>
    extends _$OpenCreditCardAccountsCardViewDataCopyWithImpl<$Res,
        _$OpenCreditCardAccountsCardViewDataImpl>
    implements _$$OpenCreditCardAccountsCardViewDataImplCopyWith<$Res> {
  __$$OpenCreditCardAccountsCardViewDataImplCopyWithImpl(
      _$OpenCreditCardAccountsCardViewDataImpl _value,
      $Res Function(_$OpenCreditCardAccountsCardViewDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$OpenCreditCardAccountsCardViewDataImpl(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<OpenCreditCardAccountViewData>,
    ));
  }
}

/// @nodoc

class _$OpenCreditCardAccountsCardViewDataImpl
    implements _OpenCreditCardAccountsCardViewData {
  _$OpenCreditCardAccountsCardViewDataImpl(
      {required final List<OpenCreditCardAccountViewData> accounts})
      : _accounts = accounts;

  final List<OpenCreditCardAccountViewData> _accounts;
  @override
  List<OpenCreditCardAccountViewData> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'OpenCreditCardAccountsCardViewData(accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenCreditCardAccountsCardViewDataImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenCreditCardAccountsCardViewDataImplCopyWith<
          _$OpenCreditCardAccountsCardViewDataImpl>
      get copyWith => __$$OpenCreditCardAccountsCardViewDataImplCopyWithImpl<
          _$OpenCreditCardAccountsCardViewDataImpl>(this, _$identity);
}

abstract class _OpenCreditCardAccountsCardViewData
    implements OpenCreditCardAccountsCardViewData {
  factory _OpenCreditCardAccountsCardViewData(
          {required final List<OpenCreditCardAccountViewData> accounts}) =
      _$OpenCreditCardAccountsCardViewDataImpl;

  @override
  List<OpenCreditCardAccountViewData> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$OpenCreditCardAccountsCardViewDataImplCopyWith<
          _$OpenCreditCardAccountsCardViewDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OpenCreditCardAccountViewData {
  String get name => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get utilization => throw _privateConstructorUsedError;
  DateTime get reportedOnDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OpenCreditCardAccountViewDataCopyWith<OpenCreditCardAccountViewData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenCreditCardAccountViewDataCopyWith<$Res> {
  factory $OpenCreditCardAccountViewDataCopyWith(
          OpenCreditCardAccountViewData value,
          $Res Function(OpenCreditCardAccountViewData) then) =
      _$OpenCreditCardAccountViewDataCopyWithImpl<$Res,
          OpenCreditCardAccountViewData>;
  @useResult
  $Res call(
      {String name,
      int balance,
      int limit,
      int utilization,
      DateTime reportedOnDate});
}

/// @nodoc
class _$OpenCreditCardAccountViewDataCopyWithImpl<$Res,
        $Val extends OpenCreditCardAccountViewData>
    implements $OpenCreditCardAccountViewDataCopyWith<$Res> {
  _$OpenCreditCardAccountViewDataCopyWithImpl(this._value, this._then);

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
    Object? utilization = null,
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
      utilization: null == utilization
          ? _value.utilization
          : utilization // ignore: cast_nullable_to_non_nullable
              as int,
      reportedOnDate: null == reportedOnDate
          ? _value.reportedOnDate
          : reportedOnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenCreditCardAccountViewDataImplCopyWith<$Res>
    implements $OpenCreditCardAccountViewDataCopyWith<$Res> {
  factory _$$OpenCreditCardAccountViewDataImplCopyWith(
          _$OpenCreditCardAccountViewDataImpl value,
          $Res Function(_$OpenCreditCardAccountViewDataImpl) then) =
      __$$OpenCreditCardAccountViewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int balance,
      int limit,
      int utilization,
      DateTime reportedOnDate});
}

/// @nodoc
class __$$OpenCreditCardAccountViewDataImplCopyWithImpl<$Res>
    extends _$OpenCreditCardAccountViewDataCopyWithImpl<$Res,
        _$OpenCreditCardAccountViewDataImpl>
    implements _$$OpenCreditCardAccountViewDataImplCopyWith<$Res> {
  __$$OpenCreditCardAccountViewDataImplCopyWithImpl(
      _$OpenCreditCardAccountViewDataImpl _value,
      $Res Function(_$OpenCreditCardAccountViewDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? limit = null,
    Object? utilization = null,
    Object? reportedOnDate = null,
  }) {
    return _then(_$OpenCreditCardAccountViewDataImpl(
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
      utilization: null == utilization
          ? _value.utilization
          : utilization // ignore: cast_nullable_to_non_nullable
              as int,
      reportedOnDate: null == reportedOnDate
          ? _value.reportedOnDate
          : reportedOnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$OpenCreditCardAccountViewDataImpl
    implements _OpenCreditCardAccountViewData {
  _$OpenCreditCardAccountViewDataImpl(
      {required this.name,
      required this.balance,
      required this.limit,
      required this.utilization,
      required this.reportedOnDate});

  @override
  final String name;
  @override
  final int balance;
  @override
  final int limit;
  @override
  final int utilization;
  @override
  final DateTime reportedOnDate;

  @override
  String toString() {
    return 'OpenCreditCardAccountViewData(name: $name, balance: $balance, limit: $limit, utilization: $utilization, reportedOnDate: $reportedOnDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenCreditCardAccountViewDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.utilization, utilization) ||
                other.utilization == utilization) &&
            (identical(other.reportedOnDate, reportedOnDate) ||
                other.reportedOnDate == reportedOnDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, balance, limit, utilization, reportedOnDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenCreditCardAccountViewDataImplCopyWith<
          _$OpenCreditCardAccountViewDataImpl>
      get copyWith => __$$OpenCreditCardAccountViewDataImplCopyWithImpl<
          _$OpenCreditCardAccountViewDataImpl>(this, _$identity);
}

abstract class _OpenCreditCardAccountViewData
    implements OpenCreditCardAccountViewData {
  factory _OpenCreditCardAccountViewData(
          {required final String name,
          required final int balance,
          required final int limit,
          required final int utilization,
          required final DateTime reportedOnDate}) =
      _$OpenCreditCardAccountViewDataImpl;

  @override
  String get name;
  @override
  int get balance;
  @override
  int get limit;
  @override
  int get utilization;
  @override
  DateTime get reportedOnDate;
  @override
  @JsonKey(ignore: true)
  _$$OpenCreditCardAccountViewDataImplCopyWith<
          _$OpenCreditCardAccountViewDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
