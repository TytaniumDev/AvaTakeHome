import 'package:ava_take_home/components/employment_info/employment_info_view_model.dart';
import 'package:ava_take_home/model/employment_info.dart';
import 'package:ava_take_home/routes/home_page.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

@immutable
class EmploymentInfoViewData {
  final EmploymentType employmentType;
  final String employer;
  final String jobTitle;
  final int grossAnnualIncome;
  final PayFrequency payFrequency;
  final DateTime nextPayday;
  final bool isPayDirectDeposit;
  final String employerAddress;
  final int timeWithEmployerYears;
  final int timeWithEmployerMonths;

  const EmploymentInfoViewData({
    required this.employmentType,
    required this.employer,
    required this.jobTitle,
    required this.grossAnnualIncome,
    required this.payFrequency,
    required this.nextPayday,
    required this.isPayDirectDeposit,
    required this.employerAddress,
    required this.timeWithEmployerYears,
    required this.timeWithEmployerMonths,
  });
}

class EmploymentInfoView extends ConsumerWidget {
  const EmploymentInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(employmentInfoViewModelProvider);

    return Column(
      children: [
        Expanded(
          child: switch (viewData) {
            AsyncData(:final value) => const Text('We got data'),
            AsyncValue(:final error?) => Text('We got error: $error'),
            _ => const CircularProgressIndicator(),
          },
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  color: AppColors.manilla,
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.avaPrimary,
            elevation: 0,
          ),
          child: const Text(
            'Confirm',
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 16,
              fontFamily: 'At Hauss TRIAL',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
