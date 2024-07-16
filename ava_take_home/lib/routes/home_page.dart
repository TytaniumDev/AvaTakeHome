import 'package:ava_take_home/demo_mode.dart';
import 'package:ava_take_home/ui/adaptive.dart';
import 'package:ava_take_home/components/ava_account_detail_card/ava_account_detail_card_view.dart';
import 'package:ava_take_home/components/credit_factors/credit_factors_view.dart';
import 'package:ava_take_home/components/credit_score_chart_card/credit_score_chart_card_view.dart';
import 'package:ava_take_home/components/credit_score_header/credit_score_header_view.dart';
import 'package:ava_take_home/components/open_credit_card_accounts_card/open_credit_card_accounts_card_view.dart';
import 'package:ava_take_home/components/total_balance_card/total_balance_card_view.dart';
import 'package:ava_take_home/routes/settings.dart';
import 'package:ava_take_home/ui/theme.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  static const route = "/";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            ref.read(demoModeProvider.notifier).toggleDemoMode();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Toggled Demo Mode!')),
            );
          },
          child: const Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
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
              child: ResponsiveContainer(
                child: _HomePageList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageList extends StatefulWidget {
  const _HomePageList();

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
      const _HomeListItem(
        title: 'Chart',
        child: CreditScoreChartCardView(),
      ),
      const _HomeListItem(
        title: 'Credit factors',
        childPadding: EdgeInsets.only(top: 12),
        child: CreditFactorsView(),
      ),
      _HomeListItem(
        title: 'Account details',
        child: Column(
          children: [
            AvaAccountDetailCardView(),
            const SizedBox(height: 34),
            const TotalBalanceCardView(),
          ],
        ),
      ),
      const _HomeListItem(
        title: 'Open credit card accounts',
        child: OpenCreditCardAccountsCardView(),
      ),
    ];

    return FadingEdgeScrollView.fromScrollView(
      child: MasonryGridView.extent(
        controller: scrollController,
        maxCrossAxisExtent: gridMaxCrossAxisExtent,
        mainAxisSpacing: 24,
        padding: const EdgeInsets.only(top: 32, bottom: 16),
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return listItems[index];
        },
      ),
    );
  }
}

class _HomeListItem extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry childPadding;
  final Widget child;

  const _HomeListItem({
    required this.title,
    this.childPadding = const EdgeInsets.only(left: 16, right: 16, top: 12),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColors.textPrimaryDark,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: childPadding,
          child: child,
        ),
      ],
    );
  }
}

class _HeaderChin extends StatelessWidget {
  final Widget child;

  const _HeaderChin({required this.child});

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
