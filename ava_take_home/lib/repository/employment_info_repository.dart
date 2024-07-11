import 'package:ava_take_home/model/employment_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'employment_info_repository.g.dart';

/// The public repository that allows CRUD operations on [EmploymentInfo].
///
/// Uses [EmploymentInfoService] to actually make the changes.
@riverpod
class EmploymentInfoRepository extends _$EmploymentInfoRepository {
  @override
  Future<EmploymentInfo> build() {
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
  Future<EmploymentInfo> fetchEmploymentInfo();
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

  @override
  FutureOr<EmploymentInfo> build() {
    return fetchEmploymentInfo();
  }

  @override
  Future<EmploymentInfo> fetchEmploymentInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final employmentInfoJson = prefs.getString(_employmentInfoKey);
    if (employmentInfoJson == null) {
      return Future.error('Employment info JSON not found');
    }
    return EmploymentInfo.fromJson(employmentInfoJson);
  }

  @override
  Future<void> updateEmploymentInfo(EmploymentInfo employmentInfo) async {
    state = AsyncValue.data(employmentInfo);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_employmentInfoKey, employmentInfo.toJson());
  }
}
