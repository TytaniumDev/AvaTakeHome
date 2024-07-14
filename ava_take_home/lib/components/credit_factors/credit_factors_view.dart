import 'package:ava_take_home/components/credit_factors/credit_factors_view_model.dart';
import 'package:ava_take_home/theme.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';

part 'credit_factors_view.freezed.dart';

class CreditFactorsView extends ConsumerStatefulWidget {
  const CreditFactorsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreditFactorsViewState();
}

class _CreditFactorsViewState extends ConsumerState<CreditFactorsView> {
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
    final viewData = ref.watch(creditFactorsViewModelProvider);

    final ageOfCreditHistoryJiffy =
        Jiffy.parseFromDateTime(viewData.ageOfCreditHistory.value);

    final cards = [
      _CreditFactorCard(
        title: 'Payment History',
        info: '${viewData.paymentHistoryPercent.value}%',
        impact: viewData.paymentHistoryPercent.impact,
      ),
      _CreditFactorCard(
        title: 'Credit Card Utilization',
        info: '${viewData.creditCardUtilizationPercent.value}%',
        impact: viewData.creditCardUtilizationPercent.impact,
      ),
      _CreditFactorCard(
        title: 'Derogatory Marks',
        info: viewData.derogatoryMarks.value.toString(),
        impact: viewData.derogatoryMarks.impact,
      ),
      _CreditFactorCard(
        title: 'Age of Credit History',
        info:
            '${ageOfCreditHistoryJiffy.year}ys ${ageOfCreditHistoryJiffy.month}mo',
        impact: viewData.ageOfCreditHistory.impact,
      ),
      _CreditFactorCard(
        title: 'Hard Inquiries',
        info: viewData.hardInquires.value.toString(),
        impact: viewData.hardInquires.impact,
      ),
      _CreditFactorCard(
        title: 'Total Accounts',
        info: viewData.totalAccounts.value.toString(),
        impact: viewData.totalAccounts.impact,
      ),
    ];

    return SizedBox(
      height: 160,
      child: FadingEdgeScrollView.fromScrollView(
        child: ListView.separated(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (BuildContext context, int index) {
            return cards[index];
          },
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemCount: 6,
        ),
      ),
    );
  }
}

/// A strictly styled widget to render a Credit Factor card.
///
/// Accepts raw values (such as [String]s for text), as it will handle the
/// styling.
class _CreditFactorCard extends StatelessWidget {
  final String title;
  final String info;
  final ImpactLevel impact;

  const _CreditFactorCard({
    super.key,
    required this.title,
    required this.info,
    required this.impact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 144,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
      decoration: homePageCardBoxDecoration(borderRadius: 16),
      child: Column(
        children: [
          SizedBox(
            height: 36,
            width: 106,
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimaryDark,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            info,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.avaPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _impactChipBackgroundColor(impact),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(
                impact.toDisplayString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _impactChipTextColor(impact),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _impactChipBackgroundColor(ImpactLevel impact) {
    switch (impact) {
      case ImpactLevel.high:
        return AppColors.textGreen;
      case ImpactLevel.medium:
        return AppColors.avaSecondary;
      case ImpactLevel.low:
        return AppColors.avaSecondaryLight;
    }
  }

  Color _impactChipTextColor(ImpactLevel impact) {
    switch (impact) {
      case ImpactLevel.high:
        return AppColors.textWhite;
      case ImpactLevel.medium:
        return AppColors.textWhite;
      case ImpactLevel.low:
        return AppColors.textGreen;
    }
  }
}

@freezed
class CreditFactorsViewData with _$CreditFactorsViewData {
  factory CreditFactorsViewData({
    required CreditFactorViewData<int> paymentHistoryPercent,
    required CreditFactorViewData<int> creditCardUtilizationPercent,
    required CreditFactorViewData<int> derogatoryMarks,
    required CreditFactorViewData<DateTime> ageOfCreditHistory,
    required CreditFactorViewData<int> hardInquires,
    required CreditFactorViewData<int> totalAccounts,
  }) = _CreditFactorsViewData;
}

@freezed
class CreditFactorViewData<T> with _$CreditFactorViewData {
  factory CreditFactorViewData({
    required T value,
    required ImpactLevel impact,
  }) = _CreditFactorViewData;
}

enum ImpactLevel {
  high,
  medium,
  low,
}

extension on ImpactLevel {
  String toDisplayString() {
    switch (this) {
      case ImpactLevel.high:
        return 'HIGH IMPACT';
      case ImpactLevel.medium:
        return 'MEDIUM IMPACT';
      case ImpactLevel.low:
        return 'LOW IMPACT';
    }
  }
}
