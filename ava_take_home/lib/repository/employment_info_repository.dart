import 'dart:convert';

import 'package:ava_take_home/model/employment_info.dart';
import 'package:jiffy/jiffy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'employment_info_repository.g.dart';

/// The public repository that allows CRUD operations on [EmploymentInfo].
///
/// Uses [EmploymentInfoService] to actually make the changes.
@riverpod
class EmploymentInfoRepository extends _$EmploymentInfoRepository {
  @override
  FutureOr<EmploymentInfo> build() {
    return ref.watch(employmentInfoServiceImplProvider).fetchEmploymentInfo();
  }

  Future<void> updateEmploymentInfo(EmploymentInfo employmentInfo) {
    return ref
        .watch(employmentInfoServiceImplProvider)
        .updateEmploymentInfo(employmentInfo);
  }
}

/// The interface for a service that can perform CRUD operations on
/// [EmploymentInfo].
abstract class EmploymentInfoService {
  FutureOr<EmploymentInfo> fetchEmploymentInfo();
  Future<void> updateEmploymentInfo(EmploymentInfo employmentInfo);
}

/// A provider for the [EmploymentInfoService] interface.
@riverpod
EmploymentInfoService employmentInfoServiceImpl(
  EmploymentInfoServiceImplRef ref,
) {
  // In real code, we could switch between endpoints, demo mode, and mocks here.
  return LocalEmploymentInfo();
}

/// An implementation of a [EmploymentInfoService] that uses Shared Preferences
/// to store the [EmploymentInfo].
///
/// This is a simple solution that allows us to persist this data through app
/// restarts. In real code, a database would likely be used instead.
@riverpod
class LocalEmploymentInfo extends _$LocalEmploymentInfo
    implements EmploymentInfoService {
  static const _employmentInfoKey = 'employmentInfoJson';

  /// To simplify this project, assume that the user must have previously
  /// entered their employment info somewhere in the onboarding flow.
  ///
  /// This initial employment info represents the info we would get back from the
  /// server, assuming the above happened.
  final _initialEmploymentInfo = EmploymentInfo(
    employmentType: EmploymentType.fullTime,
    employer: 'Apple Inc',
    jobTitle: 'Software engineer',
    grossAnnualIncome: 150000,
    payFrequency: PayFrequency.biweekly,
    nextPayday: DateTime.utc(2023, DateTime.september, 22),
    isPayDirectDeposit: true,
    employerAddress: 'Apple One Apple Park Way, Cupertino, CA 95014',
    // In real code we wouldn't be subtracting arbitrary time from the current
    // time to understand the user's time with their employer.
    //
    // Because this is a demo project and I'm trying to match the UI, this
    // is a bit of a hack to get the UI to display 1 year 3 months.
    employerStartDate: Jiffy.now().subtract(years: 1, months: 3).dateTime,
  );

  @override
  FutureOr<EmploymentInfo> build() async {
    return fetchEmploymentInfo();
  }

  @override
  Future<EmploymentInfo> fetchEmploymentInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final employmentInfoJson = prefs.getString(_employmentInfoKey);
    if (employmentInfoJson == null) {
      await updateEmploymentInfo(_initialEmploymentInfo);
      return _initialEmploymentInfo;
    }
    return EmploymentInfo.fromJson(jsonDecode(employmentInfoJson));
  }

  @override
  Future<void> updateEmploymentInfo(EmploymentInfo employmentInfo) async {
    state = AsyncValue.data(employmentInfo);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_employmentInfoKey, jsonEncode(employmentInfo));
  }
}
