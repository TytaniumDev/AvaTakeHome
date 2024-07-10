import 'package:ava_take_home/home.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AvaApp(),
    ),
  );
}

class AvaApp extends StatelessWidget {
  const AvaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ava Take Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.avaPrimary),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
