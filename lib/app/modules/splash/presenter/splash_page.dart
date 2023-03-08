import 'package:audio_sextafeira/app/app_module.dart';
import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/filter_entity.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/tables.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/sqflite_storage_interface.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:audio_sextafeira/app/utils/constants.dart';
import 'package:audio_sextafeira/app/utils/formatters.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future carregaDados() async {
    BotToast.showText(
      text: 'Carregando audios',
      duration: const Duration(seconds: 5),
    );
    BotToast.showLoading(
      wrapAnimation: (controller, cancelFunc, widget) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
            ),
            child: CircularProgressIndicator(
              color: AppTheme.colors.primary,
            ),
          ),
        ),
      ),
    );

    final db = Modular.get<ISQLFliteStorage>();

    for (var audio in listAudios) {
      final filters =
          FilterEntity(name: 'id', value: audio.id, type: FilterType.equal);

      final getParams = SQLFliteGetPerFilterParam(
          table: Tables.meus_audios, filters: {filters});

      final result = await db.getPerFilter(getParams);

      if (result.isEmpty) {
        final params = SQLFliteInsertParam(
          table: Tables.meus_audios,
          data: {
            'id': audio.id,
            'title': audio.name,
            'path_file': audio.filePath,
            'button_color': audio.buttonColor.toHex(),
            'assets': 1,
            'favorito': 0,
          },
        );

        await db.create(params);
      } else {
        final param = SQLFliteUpdateParam(
          table: Tables.meus_audios,
          id: audio.id,
          field: 'button_color',
          value: randomColor().toHex(),
        );

        await db.update(param);
      }
    }
  }

  Future init() async {
    await Modular.isModuleReady<AppModule>();

    await carregaDados();

    await Future.delayed(const Duration(seconds: 2));

    BotToast.closeAllLoading();
    BotToast.cleanAll();

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
              'Sons Engraçados',
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
