import 'package:ava_take_home/components/credit_factors/credit_factors_view.dart';
import 'package:jiffy/jiffy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_factors_view_model.g.dart';

@riverpod
class CreditFactorsViewModel extends _$CreditFactorsViewModel {
  @override
  CreditFactorsViewData build() {
    return CreditFactorsViewData(
      paymentHistoryPercent: CreditFactorViewData(
        value: 100,
        impact: ImpactLevel.high,
      ),
      creditCardUtilizationPercent: CreditFactorViewData(
        value: 4,
        impact: ImpactLevel.low,
      ),
      derogatoryMarks: CreditFactorViewData(
        value: 2,
        impact: ImpactLevel.medium,
      ),
      ageOfCreditHistory: CreditFactorViewData(
        value: Jiffy.parseFromDateTime(DateTime.utc(0))
            .add(years: 1, months: 3)
            .dateTime,
        impact: ImpactLevel.low,
      ),
      hardInquires: CreditFactorViewData(
        value: 3,
        impact: ImpactLevel.medium,
      ),
      totalAccounts: CreditFactorViewData(
        value: 9,
        impact: ImpactLevel.medium,
      ),
    );
  }
}
