import 'package:ava_take_home/components/credit_score_header/credit_score_header_view.dart';
import 'package:ava_take_home/routes/settings.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const route = "/";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'At Hauss',
            fontWeight: FontWeight.w600,
            height: 0.09,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.avaPrimary,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/settings.svg',
          ),
          tooltip: "Settings",
          onPressed: () => context.go(SettingsPage.route),
        ),
      ),
      backgroundColor: AppColors.manilla,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderChin(
              child: CreditScoreHeaderView(),
            ),
            Expanded(
              child: ListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderChin extends StatelessWidget {
  final Widget child;

  const HeaderChin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        left: 20,
        right: 20,
        bottom: 24,
      ),
      decoration: const ShapeDecoration(
        color: AppColors.avaPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
      ),
      child: child,
    );
  }
}
