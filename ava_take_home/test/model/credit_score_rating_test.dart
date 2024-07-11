import 'package:ava_take_home/model/credit_score_rating.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('fromCreditScore', () {
    void testScoresGiveRating(
      CreditScoreRating expectedRating,
      int lowEnd,
      int highEnd,
    ) {
      final testScores =
          List.generate(highEnd - lowEnd + 1, (number) => number + lowEnd);
      for (final creditScore in testScores) {
        expect(
          CreditScoreRating.fromCreditScore(creditScore),
          expectedRating,
          reason: "Credit score of $creditScore gives "
              "${CreditScoreRating.fromCreditScore(creditScore)}, "
              "expected $expectedRating",
        );
      }
    }

    test('returns Excellent rating for scores between 800 and 850', () {
      testScoresGiveRating(CreditScoreRating.excellent, 800, 850);
    });
    test('returns Very Good rating for scores between 740 and 799', () {
      testScoresGiveRating(CreditScoreRating.veryGood, 740, 799);
    });
    test('returns Good rating for scores between 670 and 739', () {
      testScoresGiveRating(CreditScoreRating.good, 670, 739);
    });
    test('returns Fair rating for scores between 580 and 669', () {
      testScoresGiveRating(CreditScoreRating.fair, 580, 669);
    });
    test('returns Poor rating for scores between 300 and 579', () {
      testScoresGiveRating(CreditScoreRating.poor, 300, 579);
    });
    test('returns Poor rating for invalid credit scores below 300', () {
      expect(CreditScoreRating.fromCreditScore(0), CreditScoreRating.poor);
      expect(CreditScoreRating.fromCreditScore(-50), CreditScoreRating.poor);
    });
    test('returns Excellent rating for invalid credit scores above 850', () {
      expect(
        CreditScoreRating.fromCreditScore(1000),
        CreditScoreRating.excellent,
      );
    });
  });
}
