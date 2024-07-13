import 'package:ava_take_home/components/employment_info/employment_info_view.dart';
import 'package:ava_take_home/model/employment_info.dart';
import 'package:ava_take_home/repository/employment_info_repository.dart';
import 'package:jiffy/jiffy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employment_info_view_model.g.dart';

@riverpod
class EmploymentInfoViewModel extends _$EmploymentInfoViewModel {
  late LocalEmploymentInfo _repository;

  /// This isn't ideal, as the repository should be the constant source of
  /// truth.
  /// This is a time save to not have to copy a bunch of functions over to the
  /// repo.
  late EmploymentInfo _latestEmploymentInfo;

  @override
  FutureOr<EmploymentInfoViewData> build() {
    final employmentInfoModel = ref.watch(localEmploymentInfoProvider);
    _repository = ref.read(localEmploymentInfoProvider.notifier);

    return employmentInfoModel.when(
      error: (error, stack) =>
          Future.error('From the ViewModel: $error\n$stack'),
      //TODO Figure out how to propogate loading state.
      loading: () => Future.error('Loading'),
      data: (model) {
        _latestEmploymentInfo = model;
        return Future.value(_createFromModel(model));
      },
    );
  }

  EmploymentInfoViewData _createFromModel(EmploymentInfo model) {
    // Using DateTime.now() would have a bug where if the app was open over
    // a month, the value would technically be incorrect.
    //
    // If this is an issue, some sort of refresh timer could be implemented,
    // or a push from a server, but both seem a bit overkill.

    // Create Jiffy instances representing the start of each month for both
    // the current time and the date the user began employment with their
    // current employer.
    final jiffyCurrentMonth = Jiffy.now().startOf(Unit.month);
    final jiffyStartDate =
        Jiffy.parseFromDateTime(model.employerStartDate).startOf(Unit.month);

    // Use Jiffy to easily calculate the years and months of employment.
    final yearsOfEmployment =
        jiffyCurrentMonth.diff(jiffyStartDate, unit: Unit.year);
    final monthsOfEmployment =
        jiffyCurrentMonth.diff(jiffyStartDate, unit: Unit.month) -
            (yearsOfEmployment * 12);

    return EmploymentInfoViewData(
      employmentType: model.employmentType,
      employer: model.employer,
      jobTitle: model.jobTitle,
      grossAnnualIncome: model.grossAnnualIncome,
      payFrequency: model.payFrequency,
      nextPayday: model.nextPayday,
      isPayDirectDeposit: model.isPayDirectDeposit,
      employerAddress: model.employerAddress,
      timeWithEmployerYears: yearsOfEmployment.toInt(),
      timeWithEmployerMonths: monthsOfEmployment.toInt(),
    );
  }

  void updateEmploymentType(EmploymentType employmentType) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(employmentType: employmentType),
    );
  }

  void updateEmployer(String employer) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(employer: employer),
    );
  }

  void updateJobTitle(String jobTitle) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(jobTitle: jobTitle),
    );
  }

  void updateGrossAnnualIncome(int grossAnnualIncome) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(grossAnnualIncome: grossAnnualIncome),
    );
  }

  void updatePayFrequency(PayFrequency payFrequency) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(payFrequency: payFrequency),
    );
  }

  void updateNextPayday(DateTime nextPayday) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(nextPayday: nextPayday),
    );
  }

  void updateIsPayDirectDeposit(bool isPayDirectDeposit) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(isPayDirectDeposit: isPayDirectDeposit),
    );
  }

  void updateEmployerAddress(String employerAddress) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(employerAddress: employerAddress),
    );
  }

  void updateTimeWithEmployer(int years, int months) {
    _repository.updateEmploymentInfo(
      _latestEmploymentInfo.copyWith(
        employerStartDate:
            Jiffy.now().subtract(years: years, months: months).dateTime,
      ),
    );
  }
}
