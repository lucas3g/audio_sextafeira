import 'package:audio_sextafeira/app/app_module.dart';
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
  }

  @override
  void initState() {
    super.initState();

    init();

    Modular.to.navigate('/home/');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
