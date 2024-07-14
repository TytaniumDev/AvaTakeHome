import 'package:ava_take_home/components/credit_factors/credit_factors_view.dart';
import 'package:ava_take_home/components/credit_score_header/credit_score_header_view.dart';
import 'package:ava_take_home/components/feedback_sheet/feedback_sheet_view.dart';
import 'package:ava_take_home/components/open_credit_card_accounts_card/open_credit_card_accounts_card_view.dart';
import 'package:ava_take_home/routes/settings.dart';
import 'package:ava_take_home/theme.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            fontWeight: FontWeight.w600,
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
      body: const SafeArea(
        child: Column(
          children: [
            _HeaderChin(
              child: CreditScoreHeaderView(),
            ),
            Expanded(
              child: _HomePageList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageList extends StatefulWidget {
  const _HomePageList({super.key});

  @override
  State<_HomePageList> createState() => __HomePageListState();
}

class __HomePageListState extends State<_HomePageList> {
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
    final listItems = [
      Column(
        children: [
          const Text(
            'Chart',
            style: TextStyle(
              color: AppColors.textPrimaryDark,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 343,
            height: 261,
            decoration: homePageCardBoxDecoration(),
          ),
        ],
      ),
      const Column(
        children: [
          Text(
            'Credit factors',
            style: TextStyle(
              color: AppColors.textPrimaryDark,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          CreditFactorsView(),
        ],
      ),
      const Column(
        children: [
          Text(
            'Account details',
            style: TextStyle(
              color: AppColors.textPrimaryDark,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          
        ],
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Open credit card accounts',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.textPrimaryDark,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            OpenCreditCardAccountsCardView(),
          ],
        ),
      ),
    ];

    return FadingEdgeScrollView.fromScrollView(
      child: MasonryGridView.extent(
        controller: scrollController,
        maxCrossAxisExtent: 640,
        padding: const EdgeInsets.only(top: 32, bottom: 16),
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return listItems[index];
        },
      ),
    );
  }
}

class _HeaderChin extends StatelessWidget {
  final Widget child;

  const _HeaderChin({super.key, required this.child});

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
