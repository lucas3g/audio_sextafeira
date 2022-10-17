import 'package:audio_sextafeira/app/app_module.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:audio_sextafeira/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future init() async {
    await Modular.isModuleReady<AppModule>();

    await Future.delayed(const Duration(seconds: 2));

    Modular.to.navigate('/home/');
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: context.screenWidth * .5,
            ),
            const SizedBox(height: 10),
            Text(
              'Audios para Sexta Feira',
              style: AppTheme.textStyles.titleAppBar.copyWith(
                color: AppTheme.colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
