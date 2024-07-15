import 'package:ava_take_home/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditScoreChartCardView extends ConsumerWidget {
  const CreditScoreChartCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 343,
      height: 261,
      decoration: homePageCardBoxDecoration(),
    );
  }
}
