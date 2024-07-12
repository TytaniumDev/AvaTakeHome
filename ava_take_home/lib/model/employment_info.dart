import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employment_info.freezed.dart';
part 'employment_info.g.dart';

@freezed
class EmploymentInfo with _$EmploymentInfo {
  const factory EmploymentInfo({
    required EmploymentType employmentType,
    required String employer,
    required String jobTitle,
    required int grossAnnualIncome,
    required PayFrequency payFrequency,
    required DateTime nextPayday,
    required bool isPayDirectDeposit,
    required String employerAddress,
    required DateTime employerStartDate,
  }) = _EmploymentInfo;

  factory EmploymentInfo.fromJson(Map<String, Object?> json) =>
      _$EmploymentInfoFromJson(json);
}

enum EmploymentType {
  fullTime,
  partTime,
  contract,
  independentContractor,
  temporary,
  unemployed;
}

enum PayFrequency {
  weekly,
  biweekly,
  semimonthly,
  monthly,
}
