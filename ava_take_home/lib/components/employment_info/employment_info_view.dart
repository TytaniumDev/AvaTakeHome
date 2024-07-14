import 'package:ava_take_home/common/text_validators.dart';
import 'package:ava_take_home/components/employment_info/employment_info_view_model.dart';
import 'package:ava_take_home/components/feedback_sheet/feedback_sheet_view.dart';
import 'package:ava_take_home/model/employment_info.dart';
import 'package:ava_take_home/routes/home_page.dart';
import 'package:ava_take_home/theme.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
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
  bool _inputsAreValid = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 640,
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
                onFormChanged: (isValid) {
                  setState(() {
                    _inputsAreValid = isValid;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12),
              child: Column(
                children: [
                  _EditModeAnimatedSwitcher(
                    viewModeChild: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _inEditMode = !_inEditMode;
                          });
                        },
                        child: const Text('Edit'),
                      ),
                    ),
                    editModeChild: const SizedBox(
                      height: 0,
                      width: double.infinity,
                    ),
                    inEditMode: _inEditMode,
                  ),
                  _EditModeAnimatedSwitcher(
                    viewModeChild: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.pop(HomePage.route);
                            showFeedbackSheet(context);
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                    editModeChild: ElevatedButton(
                      onPressed: _formKey.currentState == null ||
                              _formKey.currentState!.validate()
                          ? () {
                              setState(() {
                                _inEditMode = !_inEditMode;
                              });
                            }
                          : null,
                      child: const Text('Continue'),
                    ),
                    inEditMode: _inEditMode,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The static header above the employment info details.
///
/// Changes contents based on if we're [inEditMode].
class _Header extends StatelessWidget {
  final bool inEditMode;

  const _Header({required this.inEditMode});

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
              fontWeight: FontWeight.w400,
            ),
          ),
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
  final Function(bool isValid) onFormChanged;

  const _EmploymentInfoForm({
    required this.formKey,
    required this.inEditMode,
    required this.onFormChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const paydayDateFormat = 'MMM do, yyyy [(]EEEE[)]';
    const expandArrow = Icon(
      Icons.keyboard_arrow_down_rounded,
      color: AppColors.textLight,
    );
    const collapseArrow = Icon(
      Icons.keyboard_arrow_up_rounded,
      color: AppColors.textLight,
    );

    final viewData = ref.watch(employmentInfoViewModelProvider);
    final viewModel = ref.read(employmentInfoViewModelProvider.notifier);

    final currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);
    final currencyEditFormat = NumberFormat.decimalPattern();

    return viewData.when(
      skipLoadingOnReload: true,
      error: (error, stack) {
        return Text('Error: $error\n$stack');
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      data: (viewData) {
        final formWidgets = [
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Employment type',
            info: viewData.employmentType.toDisplayString(),
            editWidget: DropdownMenu(
              expandedInsets: EdgeInsets.zero,
              initialSelection: viewData.employmentType,
              trailingIcon: expandArrow,
              selectedTrailingIcon: collapseArrow,
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
            editWidget: TextFormField(
              initialValue: viewData.employer,
              validator: notEmptyValidator,
              autofillHints: const [AutofillHints.organizationName],
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (text) => viewModel.updateEmployer(text),
            ),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Job title',
            info: viewData.jobTitle,
            editWidget: TextFormField(
              initialValue: viewData.jobTitle,
              validator: notEmptyValidator,
              autofillHints: const [AutofillHints.jobTitle],
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (text) => viewModel.updateJobTitle(text),
            ),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Gross annual income',
            info: '${currencyFormat.format(viewData.grossAnnualIncome)}/year',
            editWidget: TextFormField(
              decoration: InputDecoration(
                prefixText: NumberFormat.compactSimpleCurrency().currencySymbol,
                suffixText: '/year',
                suffixStyle: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: notEmptyValidator,
              initialValue:
                  currencyEditFormat.format(viewData.grossAnnualIncome),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                // Limit length to 18 to not go over the int limit.
                LengthLimitingTextInputFormatter(18),
              ],
              onFieldSubmitted: (text) =>
                  viewModel.updateGrossAnnualIncome(int.parse(text)),
            ),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Pay frequency',
            info: viewData.payFrequency.toDisplayString(),
            editWidget: DropdownMenu(
              trailingIcon: expandArrow,
              selectedTrailingIcon: collapseArrow,
              expandedInsets: EdgeInsets.zero,
              initialSelection: viewData.payFrequency,
              onSelected: (type) =>
                  type != null ? viewModel.updatePayFrequency(type) : {},
              dropdownMenuEntries: PayFrequency.values.map((type) {
                return DropdownMenuEntry(
                  label: type.toDisplayString(),
                  value: type,
                );
              }).toList(),
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: inEditMode ? 96 : 44),
            child: _AnimatedInfoField(
              inEditMode: inEditMode,
              title: 'Employer address',
              info: viewData.employerAddress,
              editWidget: TextFormField(
                validator: notEmptyValidator,
                initialValue: viewData.employerAddress,
                maxLines: null,
                autofillHints: const [AutofillHints.fullStreetAddress],
                keyboardType: TextInputType.streetAddress,
                textCapitalization: TextCapitalization.words,
                onFieldSubmitted: (text) =>
                    viewModel.updateEmployerAddress(text),
              ),
            ),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Time with employer',
            // TODO make this handle plurals
            info:
                '${viewData.timeWithEmployerYears} year ${viewData.timeWithEmployerMonths} months',
            editWidget: Row(
              children: [
                Expanded(
                  child: DropdownMenu(
                    trailingIcon: expandArrow,
                    selectedTrailingIcon: collapseArrow,
                    expandedInsets: EdgeInsets.zero,
                    initialSelection: viewData.timeWithEmployerYears,
                    onSelected: (type) => type != null
                        ? viewModel.updateTimeWithEmployerYears(type)
                        : {},
                    dropdownMenuEntries:
                        List.generate(100, (number) => number).map((number) {
                      return DropdownMenuEntry(
                        // TODO Handle plurals
                        label: '$number year',
                        value: number,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownMenu(
                    trailingIcon: expandArrow,
                    selectedTrailingIcon: collapseArrow,
                    expandedInsets: EdgeInsets.zero,
                    initialSelection: viewData.timeWithEmployerMonths,
                    onSelected: (type) => type != null
                        ? viewModel.updateTimeWithEmployerMonths(type)
                        : {},
                    dropdownMenuEntries:
                        List.generate(12, (number) => number).map((number) {
                      return DropdownMenuEntry(
                        // TODO Handle plurals
                        label: '$number months',
                        value: number,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Next payday',
            info: Jiffy.parseFromDateTime(viewData.nextPayday)
                .format(pattern: paydayDateFormat),
            editWidget: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                backgroundColor: AppColors.backgroundWhite,
                side: const BorderSide(color: AppColors.borderColor),
                textStyle: const TextStyle(
                  color: AppColors.textPrimaryDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () async {
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  // It's impossible to have a next payday in the past.
                  firstDate: DateTime.now(),
                  // The longest possible pay period option is one month,
                  // so double that for some padding.
                  lastDate: Jiffy.now().add(months: 2).dateTime,
                );
                if (selectedDate != null) {
                  viewModel.updateNextPayday(selectedDate);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Jiffy.parseFromDateTime(viewData.nextPayday)
                        .format(pattern: paydayDateFormat),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: AppColors.textPrimaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    theme: const SvgTheme(currentColor: AppColors.textLight),
                  ),
                ],
              ),
            ),
          ),
          _AnimatedInfoField(
            inEditMode: inEditMode,
            title: 'Is your pay a direct deposit?',
            info: viewData.isPayDirectDeposit ? 'Yes' : 'No',
            // TODO The radio buttons don't quite match spec
            editWidget: Row(
              children: [
                GestureDetector(
                  onTap: () => viewModel.updateIsPayDirectDeposit(true),
                  child: Row(
                    children: [
                      Radio.adaptive(
                        value: true,
                        groupValue: viewData.isPayDirectDeposit,
                        onChanged: (value) {
                          if (value != null) {
                            viewModel.updateIsPayDirectDeposit(value);
                          }
                        },
                      ),
                      const Text(
                        'Yes',
                        style: TextStyle(
                          color: AppColors.textPrimaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                GestureDetector(
                  onTap: () => viewModel.updateIsPayDirectDeposit(false),
                  child: Row(
                    children: [
                      Radio.adaptive(
                        value: false,
                        groupValue: viewData.isPayDirectDeposit,
                        onChanged: (value) {
                          if (value != null) {
                            viewModel.updateIsPayDirectDeposit(value);
                          }
                        },
                      ),
                      const Text(
                        'No',
                        style: TextStyle(
                          color: AppColors.textPrimaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ];

        return _ScrollingForm(
          formKey: formKey,
          formWidgets: formWidgets,
          onFormChanged: onFormChanged,
        );
      },
    );
  }
}

class _ScrollingForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> formWidgets;
  final Function(bool isValid) onFormChanged;

  const _ScrollingForm({
    super.key,
    required this.formKey,
    required this.formWidgets,
    required this.onFormChanged,
  });

  @override
  State<_ScrollingForm> createState() => _ScrollingFormState();
}

class _ScrollingFormState extends State<_ScrollingForm> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        widget.onFormChanged(widget.formKey.currentState?.validate() ?? false);
      },
      child: AutofillGroup(
        child: FadingEdgeScrollView.fromScrollView(
          child: AlignedGridView.extent(
            padding: const EdgeInsets.only(top: 28, bottom: 4),
            controller: scrollController,
            maxCrossAxisExtent: 400,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            itemCount: widget.formWidgets.length,
            itemBuilder: (BuildContext context, int index) {
              return widget.formWidgets[index];
            },
          ),
        ),
      ),
    );
  }
}

/// A styled and very strict resusable Widget for a single employment info
/// field that switches between view and edit modes.
class _AnimatedInfoField extends StatelessWidget {
  static const _viewModeTitleTextStyle = TextStyle(
    color: AppColors.textLight,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.12,
  );
  static const _viewModeInfoTextStyle = TextStyle(
    color: AppColors.textPrimaryDark,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const _editModeTitleTextStyle = TextStyle(
    color: AppColors.textPrimaryDark,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const _viewModeMinHeight = 44.0;
  static const _editModeMinHeight = 72.0;

  final bool inEditMode;
  final String title;
  final String info;
  final Widget editWidget;

  const _AnimatedInfoField({
    required this.inEditMode,
    required this.title,
    required this.info,
    required this.editWidget,
  });

  @override
  Widget build(BuildContext context) {
    return _EditModeAnimatedSwitcher(
      viewModeChild: Container(
        constraints: const BoxConstraints(minHeight: _viewModeMinHeight),
        child: Column(
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
      ),
      editModeChild: Container(
        constraints: const BoxConstraints(minHeight: _editModeMinHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: _editModeTitleTextStyle,
            ),
            const SizedBox(height: 4),
            editWidget,
          ],
        ),
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
      sizeCurve: Curves.linear,
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
