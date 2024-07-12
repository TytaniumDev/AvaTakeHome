// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmploymentInfoImpl _$$EmploymentInfoImplFromJson(Map<String, dynamic> json) =>
    _$EmploymentInfoImpl(
      employmentType:
          $enumDecode(_$EmploymentTypeEnumMap, json['employmentType']),
      employer: json['employer'] as String,
      jobTitle: json['jobTitle'] as String,
      grossAnnualIncome: (json['grossAnnualIncome'] as num).toInt(),
      payFrequency: $enumDecode(_$PayFrequencyEnumMap, json['payFrequency']),
      nextPayday: DateTime.parse(json['nextPayday'] as String),
      isPayDirectDeposit: json['isPayDirectDeposit'] as bool,
      employerAddress: json['employerAddress'] as String,
      employerStartDate: DateTime.parse(json['employerStartDate'] as String),
    );

Map<String, dynamic> _$$EmploymentInfoImplToJson(
        _$EmploymentInfoImpl instance) =>
    <String, dynamic>{
      'employmentType': _$EmploymentTypeEnumMap[instance.employmentType]!,
      'employer': instance.employer,
      'jobTitle': instance.jobTitle,
      'grossAnnualIncome': instance.grossAnnualIncome,
      'payFrequency': _$PayFrequencyEnumMap[instance.payFrequency]!,
      'nextPayday': instance.nextPayday.toIso8601String(),
      'isPayDirectDeposit': instance.isPayDirectDeposit,
      'employerAddress': instance.employerAddress,
      'employerStartDate': instance.employerStartDate.toIso8601String(),
    };

const _$EmploymentTypeEnumMap = {
  EmploymentType.fullTime: 'fullTime',
  EmploymentType.partTime: 'partTime',
  EmploymentType.contract: 'contract',
  EmploymentType.independentContractor: 'independentContractor',
  EmploymentType.temporary: 'temporary',
  EmploymentType.unemployed: 'unemployed',
};

const _$PayFrequencyEnumMap = {
  PayFrequency.weekly: 'weekly',
  PayFrequency.biweekly: 'biweekly',
  PayFrequency.semimonthly: 'semimonthly',
  PayFrequency.monthly: 'monthly',
};
