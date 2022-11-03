import 'dart:io';

import 'package:audience_network/audience_network.dart';
import 'package:audio_sextafeira/app/app_module.dart';
import 'package:audio_sextafeira/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!Platform.isWindows) {
    AudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
      testMode: true, // optional
      iOSAdvertiserTrackingEnabled: true, //default false
    );
  }

  await initializeDateFormatting(await findSystemLocale(), '');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
