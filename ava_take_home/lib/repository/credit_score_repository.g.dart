// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_score_repository.dart';

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
    r'92501dd92891818595a33f3d3d354b4467d97c5e';

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
String _$creditScoresForLastTwelveMonthsHash() =>
    r'35b864d3ce7f0ca99c8680f967bb0dd24532533f';

/// Provides the history of the credit scores over the last twelve months,
/// one per month, with the latest scores first.
///
/// This is 100% a shortcut for the demo, the real app wouldn't behave like
/// this. There would need to be another backend endpoint to retrieve this data,
/// or some advanced filtering client side if we do pull the full credit score
/// history.
///
/// Or the UI could be more dynamic. Lots of options!
///
/// Copied from [creditScoresForLastTwelveMonths].
@ProviderFor(creditScoresForLastTwelveMonths)
final creditScoresForLastTwelveMonthsProvider =
    AutoDisposeProvider<List<CreditScore>>.internal(
  creditScoresForLastTwelveMonths,
  name: r'creditScoresForLastTwelveMonthsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$creditScoresForLastTwelveMonthsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreditScoresForLastTwelveMonthsRef
    = AutoDisposeProviderRef<List<CreditScore>>;
String _$demoCreditScoresHash() => r'462a2fc64577a4e79f9c0fcb8226e4af5ed24532';

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
