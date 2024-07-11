
import 'package:flutter/foundation.dart';

@immutable
class CreditScore {
  /// The current credit score, as of [lastUpdatedDate].
  final int currentScore;

  /// The last time the credit score was updated from our providers.
  final DateTime lastUpdatedDate;

  /// The next time the credit score will update.
  final DateTime nextUpdateDate;

  /// The amount the credit score has changed as of the [lastUpdatedDate].
  final int latestChange;

  /// The [CreditProvider] that gave us the [currentScore] at [lastUpdatedDate].
  final CreditProvider creditProvider;

  const CreditScore({
    required this.currentScore,
    required this.lastUpdatedDate,
    required this.nextUpdateDate,
    required this.latestChange,
    required this.creditProvider,
  });

  CreditScore copyWith({
    int? currentScore,
    DateTime? lastUpdatedDate,
    DateTime? nextUpdateDate,
    int? latestChange,
    CreditProvider? creditProvider,
  }) {
    return CreditScore(
      currentScore: currentScore ?? this.currentScore,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
      nextUpdateDate: nextUpdateDate ?? this.nextUpdateDate,
      latestChange: latestChange ?? this.latestChange,
      creditProvider: creditProvider ?? this.creditProvider,
    );
  }

  @override
  String toString() {
    return 'CreditScore(currentScore: $currentScore, lastUpdatedDate: $lastUpdatedDate, nextUpdateDate: $nextUpdateDate, latestChange: $latestChange, provider: $creditProvider)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditScore &&
        other.currentScore == currentScore &&
        other.lastUpdatedDate == lastUpdatedDate &&
        other.nextUpdateDate == nextUpdateDate &&
        other.latestChange == latestChange &&
        other.creditProvider == creditProvider;
  }

  @override
  int get hashCode {
    return currentScore.hashCode ^
        lastUpdatedDate.hashCode ^
        nextUpdateDate.hashCode ^
        latestChange.hashCode ^
        creditProvider.hashCode;
  }
}

enum CreditProvider {
  equifax,
  transunion,
  experian,
}
