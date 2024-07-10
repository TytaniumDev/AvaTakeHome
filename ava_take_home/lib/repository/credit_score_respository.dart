import 'package:ava_take_home/model/credit_score.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CreditScoreRespository {
  Future<CreditScore> fetchLatestCreditScore();
  Future<List<CreditScore>> fetchCreditScoreHistory();
}
