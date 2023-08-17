import 'package:flutter/material.dart';
import 'package:tjas/src/pages/index.dart';
import 'package:tjas/src/theme.dart';

class TjasApp extends StatefulWidget {
  const TjasApp({super.key});

  @override
  State<TjasApp> createState() => _TjasAppState();
}

class _TjasAppState extends State<TjasApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      routes: {
        '/': (_) => const IndexPage(),
      },
    );
  }
}
