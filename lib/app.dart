import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:playstation_store/core/theme/app_theme.dart';
import 'package:playstation_store/router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PlayStation Manager',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
    );
  }
}
