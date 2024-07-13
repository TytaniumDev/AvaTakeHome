import 'package:ava_take_home/components/employment_info/employment_info_view.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const route = "/settings";

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.manilla,
        scrolledUnderElevation: 0,
      ),
      body: const SafeArea(child: EmploymentInfoView()),
      backgroundColor: AppColors.manilla,
    );
  }
}
