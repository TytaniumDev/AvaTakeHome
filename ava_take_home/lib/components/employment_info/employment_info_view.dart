import 'package:ava_take_home/components/employment_info/employment_info_view_model.dart';
import 'package:ava_take_home/model/employment_info.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

part 'employment_info_view.freezed.dart';

const _switchModeAnimationDuration = Duration(milliseconds: 300);

class EmploymentInfoView extends StatefulWidget {
  const EmploymentInfoView({super.key});

  @override
  State<StatefulWidget> createState() => _EmploymentInfoViewState();
}

class _EmploymentInfoViewState extends State<EmploymentInfoView> {
  final _formKey = GlobalKey<FormState>();

  bool _inEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // The padding between the header and form contents are contained
          // in the _Header widget to provide for a better looking animation.
          _Header(inEditMode: _inEditMode),
          Expanded(
            child: _EmploymentInfoForm(
              formKey: _formKey,
              inEditMode: _inEditMode,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _inEditMode = !_inEditMode;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.avaPrimary,
              elevation: 0,
            ),
            child: const Text(
              'Swap state',
              style: TextStyle(
                color: AppColors.textWhite,
                fontSize: 16,
                fontFamily: 'At Hauss TRIAL',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The static header above the employment info details.
///
/// Changes contents based on if we're [inEditMode].
class _Header extends StatelessWidget {
  final bool inEditMode;

  const _Header({super.key, required this.inEditMode});

  @override
  Widget build(BuildContext context) {
    return _EditModeAnimatedSwitcher(
      viewModeChild: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Confirm your employment',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.textPrimaryDark,
              fontSize: 40,
              fontFamily: 'At Slam Cnd',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Please review and confirm the below employment details are up-to-date.',
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: 16,
              fontFamily: 'At Hauss TRIAL',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 28),
        ],
      ),
      editModeChild: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Edit employment information',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xFF2A1E39),
              fontSize: 40,
              fontFamily: 'At Slam Cnd',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 28),
        ],
      ),
      inEditMode: inEditMode,
    );
  }
}

/// The [Form] containing all of the employment details.
///
/// Becomes editable with validation when [inEditMode] is true.
class _EmploymentInfoForm extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final bool inEditMode;

  const _EmploymentInfoForm({
    super.key,
    required this.formKey,
    required this.inEditMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(employmentInfoViewModelProvider);
    final viewModel = ref.read(employmentInfoViewModelProvider.notifier);

    final currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

    return viewData.when(
      error: (error, stack) => Text('Error: $error\n$stack'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (viewData) {
        final formWidgets = [
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Employment type',
            info: viewData.employmentType.toDisplayString(),
            editWidget: DropdownMenu(
              expandedInsets: EdgeInsets.zero,
              initialSelection: viewData.employmentType,
              onSelected: (type) =>
                  type != null ? viewModel.updateEmploymentType(type) : {},
              dropdownMenuEntries: EmploymentType.values.map((type) {
                return DropdownMenuEntry(
                  label: type.toDisplayString(),
                  value: type,
                );
              }).toList(),
            ),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Employer',
            info: viewData.employer,
            editWidget: const SizedBox(),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Job title',
            info: viewData.jobTitle,
            editWidget: const SizedBox(),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Gross annual income',
            info: '${currencyFormat.format(viewData.grossAnnualIncome)}/year',
            editWidget: const SizedBox(),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Pay frequency',
            info: viewData.payFrequency.toDisplayString(),
            editWidget: const SizedBox(),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Employer address',
            info: viewData.employerAddress,
            editWidget: const SizedBox(),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Time with employer',
            // TODO make this handle plurals
            info:
                '${viewData.timeWithEmployerYears} year ${viewData.timeWithEmployerMonths} months',
            editWidget: const SizedBox(),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Next payday',
            info: Jiffy.parseFromDateTime(viewData.nextPayday)
                .format(pattern: 'MMM do, yyyy [(]EEEE[)]'),
            editWidget: const SizedBox(),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Is your pay a direct deposit',
            info: viewData.isPayDirectDeposit ? 'Yes' : 'No',
            editWidget: const SizedBox(),
          ),
        ];

        return Form(
          key: formKey,
          child: AlignedGridView.extent(
            maxCrossAxisExtent: 400,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            itemCount: formWidgets.length,
            itemBuilder: (BuildContext context, int index) {
              return formWidgets[index];
            },
          ),
        );
      },
    );
  }
}

/// A styled and very strict resusable Widget for a single employment info
/// field that switches between view and edit modes.
class _AnimatedInfoField extends StatelessWidget {
  static const _viewModeTitleTextStyle = TextStyle(
    color: AppColors.textLight,
    fontSize: 12,
    fontFamily: 'At Hauss TRIAL',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.12,
  );
  static const _viewModeInfoTextStyle = TextStyle(
    color: AppColors.textPrimaryDark,
    fontSize: 16,
    fontFamily: 'At Hauss TRIAL',
    fontWeight: FontWeight.w400,
  );
  static const _editModeTitleTextStyle = TextStyle(
    color: AppColors.textPrimaryDark,
    fontSize: 14,
    fontFamily: 'At Hauss TRIAL',
    fontWeight: FontWeight.w600,
  );

  final bool inEditMode;
  final String title;
  final String info;
  final Widget editWidget;

  const _AnimatedInfoField({
    super.key,
    required this.inEditMode,
    required this.title,
    required this.info,
    required this.editWidget,
  });

  @override
  Widget build(BuildContext context) {
    return _EditModeAnimatedSwitcher(
      viewModeChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: _viewModeTitleTextStyle,
          ),
          Text(
            info,
            style: _viewModeInfoTextStyle,
          ),
        ],
      ),
      editModeChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: _editModeTitleTextStyle,
          ),
          editWidget,
        ],
      ),
      inEditMode: inEditMode,
    );
  }
}

/// Animates the switch between a [viewModeChild] and [editModeChild] based on
/// if we're [inEditMode].
class _EditModeAnimatedSwitcher extends StatelessWidget {
  final Widget viewModeChild;
  final Widget editModeChild;
  final bool inEditMode;

  const _EditModeAnimatedSwitcher({
    super.key,
    required this.viewModeChild,
    required this.editModeChild,
    required this.inEditMode,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: AlignmentDirectional.topStart,
      duration: _switchModeAnimationDuration,
      firstCurve: Curves.easeOut,
      secondCurve: Curves.easeIn,
      sizeCurve: Curves.easeInOut,
      firstChild: viewModeChild,
      secondChild: editModeChild,
      crossFadeState:
          inEditMode ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}

@freezed
class EmploymentInfoViewData with _$EmploymentInfoViewData {
  factory EmploymentInfoViewData({
    required EmploymentType employmentType,
    required String employer,
    required String jobTitle,
    required int grossAnnualIncome,
    required PayFrequency payFrequency,
    required DateTime nextPayday,
    required bool isPayDirectDeposit,
    required String employerAddress,
    required int timeWithEmployerYears,
    required int timeWithEmployerMonths,
  }) = _EmploymentInfoViewData;
}

extension on EmploymentType {
  String toDisplayString() {
    switch (this) {
      case EmploymentType.fullTime:
        return 'Full-time';
      case EmploymentType.partTime:
        return 'Part-time';
      case EmploymentType.contract:
        return 'Contract';
      case EmploymentType.independentContractor:
        return 'Independent Contractor';
      case EmploymentType.temporary:
        return 'Temporary';
      case EmploymentType.unemployed:
        return 'Unemployed';
    }
  }
}

extension on PayFrequency {
  String toDisplayString() {
    switch (this) {
      case PayFrequency.weekly:
        return 'Weekly';
      case PayFrequency.biweekly:
        return 'Bi-weekly';
      case PayFrequency.semimonthly:
        return 'Semi-monthly';
      case PayFrequency.monthly:
        return 'Monthly';
    }
  }
}
