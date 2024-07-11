// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_score_respository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentCreditScoreModelHash() =>
    r'cee0fc2c8e0ffb22aa08ba3765c5400d8a51b3a5';

/// See also [currentCreditScoreModel].
@ProviderFor(currentCreditScoreModel)
final currentCreditScoreModelProvider =
    AutoDisposeProvider<CreditScore>.internal(
  currentCreditScoreModel,
  name: r'currentCreditScoreModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCreditScoreModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentCreditScoreModelRef = AutoDisposeProviderRef<CreditScore>;
String _$creditScoreHistoryModelHash() =>
    r'aa6293bf1d25ea618fb65ad1343a9c70ad75bee8';

/// Provides the history of all credit scores for this user, sorted by
/// most recent first, oldest last.
///
/// Copied from [creditScoreHistoryModel].
@ProviderFor(creditScoreHistoryModel)
final creditScoreHistoryModelProvider =
    AutoDisposeProvider<List<CreditScore>>.internal(
  creditScoreHistoryModel,
  name: r'creditScoreHistoryModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$creditScoreHistoryModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreditScoreHistoryModelRef = AutoDisposeProviderRef<List<CreditScore>>;
String _$demoCreditScoresHash() => r'9d49f0b093fbad73b3098a6715cf600d24e0b203';

/// See also [DemoCreditScores].
@ProviderFor(DemoCreditScores)
final demoCreditScoresProvider =
    AutoDisposeNotifierProvider<DemoCreditScores, List<CreditScore>>.internal(
  DemoCreditScores.new,
  name: r'demoCreditScoresProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$demoCreditScoresHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DemoCreditScores = AutoDisposeNotifier<List<CreditScore>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
