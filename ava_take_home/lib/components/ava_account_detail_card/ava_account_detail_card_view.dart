import 'package:ava_take_home/components/ava_account_detail_card/ava_account_detail_card_view_model.dart';
import 'package:ava_take_home/ui/animation.dart';
import 'package:ava_take_home/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'ava_account_detail_card_view.freezed.dart';

@freezed
class AvaAccountDetailCardViewData with _$AvaAccountDetailCardViewData {
  factory AvaAccountDetailCardViewData({
    required int balance,
    required int availableToSpend,
    required int creditLimit,
    required int spendLimit,
    required int utilization,
  }) = _AvaAccountDetailCardViewData;
}

class AvaAccountDetailCardView extends ConsumerWidget {
  final currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

  AvaAccountDetailCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewData = ref.watch(avaAccountDetailCardViewModelProvider);

    return Container(
      decoration: homePageCardBoxDecoration(),
      padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FloatingAvailableToSpendIndicator(),
          const SizedBox(height: 8),
          const _SpendLimitProgressBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedText(
                'Spend limit: ${currencyFormat.format(viewData.spendLimit)} ',
                style: const TextStyle(
                  color: AppColors.textPrimaryDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'Why is it different?',
                style: TextStyle(
                  color: AppColors.lightPurple,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              AnimatedText(
                currencyFormat.format(viewData.balance),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              AnimatedText(
                currencyFormat.format(viewData.creditLimit),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                'Balance',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Text(
                'Credit limit',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(),
          ),
          Row(
            children: [
              const Text(
                'Utilization',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
        ],
      ),
    );
  }
}

class _FloatingAvailableToSpendIndicator extends ConsumerWidget {
  final currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);

  _FloatingAvailableToSpendIndicator({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableToSpend = ref.watch(
      avaAccountDetailCardViewModelProvider
          .select((viewData) => viewData.availableToSpend),
    );
    final creditLimit = ref.watch(
      avaAccountDetailCardViewModelProvider
          .select((viewData) => viewData.creditLimit),
    );

    // Make clever use of a Row and two Expandeds to push our indicator into
    // position within a Row.
    //
    // The value of the flex property in each Expanded is simply the available
    // to spend for the left Expanded, and the credit limit - available to spend
    // for the right Expanded.
    //
    // Some example of the Expanded's flex value:
    // * If available to spend is $100 and credit limit is $200, the marker
    //   should be at 50%. This means each Expanded should have the same flex
    //   value (100).
    // * If available to spend is $75 and credit limit is $100, the marker
    //   should be at 75%. This means the first Expanded should have a flex
    //   value of 75, and the second Expanded should have a flex value of 25.
    return _SqueezedPositionedRow(
      startFlex: availableToSpend,
      endFlex: creditLimit - availableToSpend,
      child: Column(
        children: [
          AnimatedContainer(
            decoration: const BoxDecoration(
              color: AppColors.avaPrimary,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            duration: animationDuration,
            padding: const EdgeInsetsDirectional.only(
              start: 8,
              end: 9,
              top: 5,
              bottom: 6,
            ),
            child: Text(
              currencyFormat.format(availableToSpend),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textWhite,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ClipPath(
            clipper: _IndicatorClipper(),
            child: Container(
              height: 6,
              width: 40,
              color: AppColors.avaPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Clipper class that will give us the pointed tip at the bottom of the
/// [_FloatingAvailableToSpendIndicator].
///
/// If I had more time, I'd implement this as a [CustomPainter] instead and draw
/// the whole indicator shape that way. I'd also round the end point, and
/// where the top of the triangle meets the base of the square in the container
/// above it.
class _IndicatorClipper extends CustomClipper<Path> {
  static const curveStartAtPercent = 0.36;

  @override
  Path getClip(Size size) {
    var firstOffset = Offset(size.width * curveStartAtPercent, 0.0);
    var secondPoint = Offset(size.width * 0.5, size.height);
    var lastPoint = Offset(size.width * (1 - curveStartAtPercent), 0.0);
    var path = Path()
      ..moveTo(firstOffset.dx, firstOffset.dy)
      ..lineTo(secondPoint.dx, secondPoint.dy)
      ..lineTo(lastPoint.dx, lastPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // No dynamic information, all clips are the same.
    return false;
  }
}

/// Shows a [AppColors.avaSecondary] marker where the user's spend limit is
/// in relation to their total credit limit.
class _SpendLimitProgressBar extends ConsumerWidget {
  const _SpendLimitProgressBar({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spendLimit = ref.watch(
      avaAccountDetailCardViewModelProvider
          .select((viewData) => viewData.spendLimit),
    );
    final creditLimit = ref.watch(
      avaAccountDetailCardViewModelProvider
          .select((viewData) => viewData.creditLimit),
    );

    // Make clever use of a Row and two Expandeds to push our marker into
    // position within a Row.
    //
    // The value of the flex property in each Expanded is simply the spending
    // limit for the left Expanded, and the credit limit - spending limit for
    // the right Expanded.
    //
    // Some example of the Expanded's flex value:
    // * If spending limit is $100 and credit limit is $200, the marker should
    //   be at 50%. This means each Expanded should have the same flex
    //   value (100).
    // * If spending limit is $25 and credit limit is $100, the marker should
    //   be at 25%. This means the first Expanded should have a flex value of
    //   25, and the second Expanded should have a flex value of 75.
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.avaSecondaryLight,
        borderRadius: BorderRadius.all(Radius.circular(999)),
      ),
      child: _SqueezedPositionedRow(
        startFlex: spendLimit,
        endFlex: creditLimit - spendLimit,
        child: Container(
          width: 4,
          height: 8,
          color: AppColors.avaSecondary,
        ),
      ),
    );
  }
}

/// An animated [Row] widget that places a [child] in between two [Expanded]
/// widgets with flex values set to the [startFlex] and [endFlex] values.
class _SqueezedPositionedRow extends StatefulWidget {
  final Widget child;
  final int startFlex;
  final int endFlex;

  const _SqueezedPositionedRow({
    // ignore: unused_element
    super.key,
    required this.child,
    required this.startFlex,
    required this.endFlex,
  });

  @override
  State<_SqueezedPositionedRow> createState() => __SqueezedPositionedRowState();
}

class __SqueezedPositionedRowState extends State<_SqueezedPositionedRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: animationDuration);

  late Animation<int> startFlexAnimation =
      AlwaysStoppedAnimation(widget.startFlex);
  late Animation<int> endFlexAnimation = AlwaysStoppedAnimation(widget.endFlex);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _SqueezedPositionedRow oldWidget) {
    super.didUpdateWidget(oldWidget);

    bool startAnimation = false;
    if (oldWidget.startFlex != widget.startFlex) {
      startFlexAnimation = IntTween(
        begin: oldWidget.startFlex,
        end: widget.startFlex,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: animationCurve,
        ),
      );
      startAnimation = true;
    }

    if (oldWidget.endFlex != widget.endFlex) {
      endFlexAnimation = IntTween(
        begin: oldWidget.endFlex,
        end: widget.endFlex,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: animationCurve,
        ),
      );
      startAnimation = true;
    }

    if (startAnimation) controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Row(
          children: [
            Expanded(
              flex: startFlexAnimation.value,
              child: const SizedBox(),
            ),
            if (child != null) child,
            Expanded(
              flex: endFlexAnimation.value,
              child: const SizedBox(),
            ),
          ],
        );
      },
      child: widget.child,
    );
  }
}
