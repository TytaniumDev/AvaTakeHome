// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_info_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$employmentInfoServiceImplHash() =>
    r'af73ff2ff07c7dff3bb3a4be26589a991aa0421f';

/// A provider for the [EmploymentInfoService] interface.
///
/// Copied from [employmentInfoServiceImpl].
@ProviderFor(employmentInfoServiceImpl)
final employmentInfoServiceImplProvider =
    AutoDisposeProvider<EmploymentInfoService>.internal(
  employmentInfoServiceImpl,
  name: r'employmentInfoServiceImplProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$employmentInfoServiceImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EmploymentInfoServiceImplRef
    = AutoDisposeProviderRef<EmploymentInfoService>;
String _$employmentInfoRepositoryHash() =>
    r'f046c53e6658ee703916da3c174415b556f9d0bf';

/// The public repository that allows CRUD operations on [EmploymentInfo].
///
/// Uses [EmploymentInfoService] to actually make the changes.
///
/// Copied from [EmploymentInfoRepository].
@ProviderFor(EmploymentInfoRepository)
final employmentInfoRepositoryProvider = AutoDisposeAsyncNotifierProvider<
    EmploymentInfoRepository, EmploymentInfo>.internal(
  EmploymentInfoRepository.new,
  name: r'employmentInfoRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$employmentInfoRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EmploymentInfoRepository = AutoDisposeAsyncNotifier<EmploymentInfo>;
String _$localEmploymentInfoHash() =>
    r'8332e819a866c099c2a2194d62364d6dc3ce694e';

/// An implementation of a [EmploymentInfoService] that uses Shared Preferences
/// to store the [EmploymentInfo].
///
/// This is a simple solution that allows us to persist this data through app
/// restarts. In real code, a database would likely be used instead.
///
/// Copied from [LocalEmploymentInfo].
@ProviderFor(LocalEmploymentInfo)
final localEmploymentInfoProvider = AutoDisposeAsyncNotifierProvider<
    LocalEmploymentInfo, EmploymentInfo>.internal(
  LocalEmploymentInfo.new,
  name: r'localEmploymentInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localEmploymentInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalEmploymentInfo = AutoDisposeAsyncNotifier<EmploymentInfo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
