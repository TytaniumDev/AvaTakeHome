import 'package:ava_take_home/routes/home_page.dart';
import 'package:ava_take_home/routes/settings.dart';
import 'package:ava_take_home/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AvaApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.route,
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: SettingsPage.route.replaceFirst('/', ''),
          builder: (_, __) => const SettingsPage(),
        ),
      ],
    ),
  ],
);

class AvaApp extends StatelessWidget {
  const AvaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ava Take Home',
      theme: avaTheme,
      routerConfig: _router,
    );
  }
}
