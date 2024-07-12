import 'package:ava_take_home/components/employment_info/employment_info_view.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const route = "/settings";

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(child: EmploymentInfoView()),
    );
  }
}
