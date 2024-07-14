import 'package:ava_take_home/components/open_credit_card_accounts_card/open_credit_card_accounts_card_view_model.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'open_credit_card_accounts_card_view.freezed.dart';

@freezed
class OpenCreditCardAccountsCardViewData
    with _$OpenCreditCardAccountsCardViewData {
  factory OpenCreditCardAccountsCardViewData({
    required List<OpenCreditCardAccountViewData> accounts,
  }) = _OpenCreditCardAccountsCardViewData;
}

@freezed
class OpenCreditCardAccountViewData with _$OpenCreditCardAccountViewData {
  factory OpenCreditCardAccountViewData({
    required String name,
    required int balance,
    required int limit,
    required int utilization,
    required DateTime reportedOnDate,
  }) = _OpenCreditCardAccountViewData;
}

class OpenCreditCardAccountsCardView extends ConsumerWidget {
  const OpenCreditCardAccountsCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(openCreditCardAccountsCardViewModelProvider);

    return Container(
      decoration: homePageCardBoxDecoration(),
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 12),
          child: Divider(),
        ),
        itemCount: viewData.accounts.length,
        itemBuilder: (context, index) {
          return _AccountDetail(viewData: viewData.accounts[index]);
        },
      ),
    );
  }
}

/// Container of all of the account data.
class _AccountDetail extends StatelessWidget {
  final OpenCreditCardAccountViewData viewData;

  const _AccountDetail({super.key, required this.viewData});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              viewData.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              '${viewData.utilization}%',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // TODO Animate this
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 16),
          child: LinearProgressIndicator(
            value: viewData.utilization / 100,
            backgroundColor: AppColors.borderColor,
            color:
                Utilization.fromPercentInt(viewData.utilization).displayColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(999 /* This is what's in the Figma spec */),
            ),
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              currencyFormat.format(viewData.balance),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Text(
              currencyFormat.format(viewData.limit),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Reported on ${DateFormat.yMMMMd().format(viewData.reportedOnDate)}',
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: AppColors.textLight,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.12,
          ),
        ),
      ],
    );
  }
}

//TODO Move this somewhere shared
enum Utilization {
  low(
    displayColor: AppColors.avaSecondary,
    inactiveColor: AppColors.avaSecondaryLight,
  ),
  medium(
    displayColor: AppColors.okayOrange,
    inactiveColor: AppColors.okayOrangeLight,
  ),
  high(
    displayColor: AppColors.badRed,
    inactiveColor: AppColors.badRedLight,
  );

  final Color displayColor;
  final Color inactiveColor;

  const Utilization({required this.displayColor, required this.inactiveColor});

  String get displayName {
    switch (this) {
      case low:
        return 'Excellent';
      case medium:
        return 'Fair';
      case high:
        return 'Poor';
    }
  }

  static Utilization fromPercentDouble(double utilizationPercentage) {
    return fromPercentInt((utilizationPercentage * 100).toInt());
  }

  static Utilization fromPercentInt(int utilizationPercentage) {
    switch (utilizationPercentage) {
      case >= 0 && <= 29:
        return Utilization.low;
      case >= 30 && <= 49:
        return Utilization.medium;
      case >= 50 && <= 75:
      default:
        return Utilization.high;
    }
  }
}
