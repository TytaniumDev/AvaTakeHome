import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class EmploymentInfo {
  final EmploymentType employmentType;
  final String employer;
  final String jobTitle;
  final int grossAnnualIncome;
  final PayFrequency payFrequency;
  final DateTime nextPayday;
  final bool isPayDirectDeposit;
  final String employerAddress;
  final DateTime employerStartDate;

  const EmploymentInfo({
    required this.employmentType,
    required this.employer,
    required this.jobTitle,
    required this.grossAnnualIncome,
    required this.payFrequency,
    required this.nextPayday,
    required this.isPayDirectDeposit,
    required this.employerAddress,
    required this.employerStartDate,
  });

  EmploymentInfo copyWith({
    EmploymentType? employmentType,
    String? employer,
    String? jobTitle,
    int? grossAnnualIncome,
    PayFrequency? payFrequency,
    DateTime? nextPayday,
    bool? isPayDirectDeposit,
    String? employerAddress,
    DateTime? employerStartDate,
  }) {
    return EmploymentInfo(
      employmentType: employmentType ?? this.employmentType,
      employer: employer ?? this.employer,
      jobTitle: jobTitle ?? this.jobTitle,
      grossAnnualIncome: grossAnnualIncome ?? this.grossAnnualIncome,
      payFrequency: payFrequency ?? this.payFrequency,
      nextPayday: nextPayday ?? this.nextPayday,
      isPayDirectDeposit: isPayDirectDeposit ?? this.isPayDirectDeposit,
      employerAddress: employerAddress ?? this.employerAddress,
      employerStartDate: employerStartDate ?? this.employerStartDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'employmentType': employmentType.name});
    result.addAll({'employer': employer});
    result.addAll({'jobTitle': jobTitle});
    result.addAll({'grossAnnualIncome': grossAnnualIncome});
    result.addAll({'payFrequency': payFrequency.name});
    result.addAll({'nextPayday': nextPayday.millisecondsSinceEpoch});
    result.addAll({'isPayDirectDeposit': isPayDirectDeposit});
    result.addAll({'employerAddress': employerAddress});
    result.addAll({'employerStartDate': employerStartDate});

    return result;
  }

  factory EmploymentInfo.fromMap(Map<String, dynamic> map) {
    return EmploymentInfo(
      employmentType: EmploymentType.values.byName(map['employmentType']),
      employer: map['employer'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      grossAnnualIncome: map['grossAnnualIncome']?.toInt() ?? 0,
      payFrequency: PayFrequency.values.byName(map['payFrequency']),
      nextPayday: DateTime.fromMillisecondsSinceEpoch(map['nextPayday']),
      isPayDirectDeposit: map['isPayDirectDeposit'] ?? false,
      employerAddress: map['employerAddress'] ?? '',
      employerStartDate: map['employerStartDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmploymentInfo.fromJson(String source) =>
      EmploymentInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EmploymentInfo(employmentType: $employmentType, employer: $employer, jobTitle: $jobTitle, grossAnnualIncome: $grossAnnualIncome, payFrequency: $payFrequency, nextPayday: $nextPayday, isPayDirectDeposit: $isPayDirectDeposit, employerAddress: $employerAddress, employerStartDate: $employerStartDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmploymentInfo &&
        other.employmentType == employmentType &&
        other.employer == employer &&
        other.jobTitle == jobTitle &&
        other.grossAnnualIncome == grossAnnualIncome &&
        other.payFrequency == payFrequency &&
        other.nextPayday == nextPayday &&
        other.isPayDirectDeposit == isPayDirectDeposit &&
        other.employerAddress == employerAddress &&
        other.employerStartDate == employerStartDate;
  }

  @override
  int get hashCode {
    return employmentType.hashCode ^
        employer.hashCode ^
        jobTitle.hashCode ^
        grossAnnualIncome.hashCode ^
        payFrequency.hashCode ^
        nextPayday.hashCode ^
        isPayDirectDeposit.hashCode ^
        employerAddress.hashCode ^
        employerStartDate.hashCode;
  }
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
