import 'package:ava_take_home/components/open_credit_card_accounts_card/open_credit_card_accounts_card_view_model.dart';
import 'package:ava_take_home/ui/animation.dart';
import 'package:ava_take_home/ui/theme.dart';
import 'package:ava_take_home/ui/utilization.dart';
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

  const _AccountDetail({required this.viewData});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            AnimatedText(
              viewData.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            AnimatedText(
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
          child: _UtilizationAmountBar(utilization: viewData.utilization),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            AnimatedText(
              currencyFormat.format(viewData.balance),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            AnimatedText(
              currencyFormat.format(viewData.limit),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        AnimatedText(
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

class _UtilizationAmountBar extends StatefulWidget {
  final int utilization;

  const _UtilizationAmountBar({
    super.key,
    required this.utilization,
  });

  @override
  State<_UtilizationAmountBar> createState() => _UtilizationAmountBarState();
}

class _UtilizationAmountBarState extends State<_UtilizationAmountBar>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: animationDuration);

  late Animation linearProgressAnimation =
      AlwaysStoppedAnimation(progressValueFromUtilization(widget.utilization));
  late Animation colorAnimation =
      AlwaysStoppedAnimation(barColorFromUtilization(widget.utilization));

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _UtilizationAmountBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      final oldColor = barColorFromUtilization(oldWidget.utilization);
      final newColor = barColorFromUtilization(widget.utilization);

      colorAnimation = ColorTween(begin: oldColor, end: newColor).animate(
        CurvedAnimation(parent: controller, curve: animationCurve),
      );

      final oldProgress = progressValueFromUtilization(oldWidget.utilization);
      final newProgress = progressValueFromUtilization(widget.utilization);

      linearProgressAnimation =
          Tween<double>(begin: oldProgress, end: newProgress).animate(
        CurvedAnimation(
          parent: controller,
          curve: animationCurve,
        ),
      );

      controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(999 /* This is what's in the Figma spec */),
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return LinearProgressIndicator(
            value: linearProgressAnimation.value,
            backgroundColor: AppColors.borderColor,
            color: colorAnimation.value,
            minHeight: 8,
          );
        },
      ),
    );
  }

  Color barColorFromUtilization(int utilization) {
    return Utilization.fromPercentInt(widget.utilization).displayColor;
  }

  double progressValueFromUtilization(int utilization) {
    return utilization / 100;
  }
}
