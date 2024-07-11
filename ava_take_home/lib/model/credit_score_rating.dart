enum CreditScoreRating {
  excellent,
  veryGood,
  good,
  fair,
  poor;

  /// The lowest credit score that qualifies for an Excellent rating.
  static const _excellentCutoff = 800;

  /// The lowest credit score that qualifies for a Very Good rating.
  static const _veryGoodCutoff = 740;

  /// The lowest credit score that qualifies for a Good rating.
  static const _goodCutoff = 670;

  /// The lowest credit score that qualifies for a Fair rating.
  static const _fairCutoff = 580;

  static CreditScoreRating fromCreditScore(int creditScore) {
    switch (creditScore) {
      case >= _excellentCutoff:
        return CreditScoreRating.excellent;
      case >= _veryGoodCutoff && < _excellentCutoff:
        return CreditScoreRating.veryGood;
      case >= _goodCutoff && < _veryGoodCutoff:
        return CreditScoreRating.good;
      case >= _fairCutoff && < _goodCutoff:
        return CreditScoreRating.fair;
      case < _fairCutoff:
      default:
        return CreditScoreRating.poor;
    }
  }
}
