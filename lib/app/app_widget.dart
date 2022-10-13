import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:audio_sextafeira/app/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigationService.navigatorKey);

    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppTheme.colors.primary,
        scaffoldBackgroundColor: AppTheme.colors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.colors.primary,
          titleTextStyle: AppTheme.textStyles.titleAppBar,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
