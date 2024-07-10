import 'dart:convert';

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
  final CreditProvider provider;

  const CreditScore({
    required this.currentScore,
    required this.lastUpdatedDate,
    required this.nextUpdateDate,
    required this.latestChange,
    required this.provider,
  });

  CreditScore copyWith({
    int? currentScore,
    DateTime? lastUpdatedDate,
    DateTime? nextUpdateDate,
    int? latestChange,
    CreditProvider? provider,
  }) {
    return CreditScore(
      currentScore: currentScore ?? this.currentScore,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
      nextUpdateDate: nextUpdateDate ?? this.nextUpdateDate,
      latestChange: latestChange ?? this.latestChange,
      provider: provider ?? this.provider,
    );
  }

  @override
  String toString() {
    return 'CreditScore(currentScore: $currentScore, lastUpdatedDate: $lastUpdatedDate, nextUpdateDate: $nextUpdateDate, latestChange: $latestChange, provider: $provider)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditScore &&
        other.currentScore == currentScore &&
        other.lastUpdatedDate == lastUpdatedDate &&
        other.nextUpdateDate == nextUpdateDate &&
        other.latestChange == latestChange &&
        other.provider == provider;
  }

  @override
  int get hashCode {
    return currentScore.hashCode ^
        lastUpdatedDate.hashCode ^
        nextUpdateDate.hashCode ^
        latestChange.hashCode ^
        provider.hashCode;
  }
}

enum CreditProvider {
  equifax,
  transunion,
  experian,
}
