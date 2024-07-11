import 'package:ava_take_home/components/employment_info/employment_info_view.dart';
import 'package:ava_take_home/model/employment_info.dart';
import 'package:ava_take_home/repository/employment_info_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employment_info_view_model.g.dart';

@riverpod
class EmploymentInfoViewModel extends _$EmploymentInfoViewModel {
  @override
  FutureOr<EmploymentInfoViewData> build() {
    final employmentInfoModel = ref.watch(employmentInfoRepositoryProvider);

    return switch (employmentInfoModel) {
      AsyncData(:final value) => Future.value(createFromModel(value)),
      AsyncValue(:final error?) => Future.error(error),
      _ => Future.error('Loading'),
    };
  }

  EmploymentInfoViewData createFromModel(EmploymentInfo model) {
    // Using DateTime.now() would have a bug where if the app was open over
    // a month breakpoint, the value would technically be incorrect.
    //
    // If this is an issue, some sort of refresh timer could be implemented,
    // or a push from a server, but both seem a bit overkill.
    final durationOfEmployment =
        DateTime.now().difference(model.employerStartDate);
    final yearsOfEmployment = durationOfEmployment.inDays ~/ 365;
    final monthsOfEmployment =
        (durationOfEmployment - Duration(days: yearsOfEmployment * 365))
                .inDays ~/
            12;

    return EmploymentInfoViewData(
      employmentType: model.employmentType,
      employer: model.employer,
      jobTitle: model.jobTitle,
      grossAnnualIncome: model.grossAnnualIncome,
      payFrequency: model.payFrequency,
      nextPayday: model.nextPayday,
      isPayDirectDeposit: model.isPayDirectDeposit,
      employerAddress: model.employerAddress,
      timeWithEmployerYears: yearsOfEmployment,
      timeWithEmployerMonths: monthsOfEmployment,
    );
  }
}
