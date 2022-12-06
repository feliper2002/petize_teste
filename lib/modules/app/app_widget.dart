import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/utils/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      theme: AppTheme.main,
      title: "Search d_evs",
    );
  }
}
