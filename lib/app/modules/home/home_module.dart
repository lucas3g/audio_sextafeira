import 'package:audio_sextafeira/app/modules/home/presenter/home_page.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/mobx/audio_store.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [
    //Player
    Bind.singleton((i) => AudioPlayer()),

    //Mobx
    Bind.singleton<AudioStore>(
      (i) => AudioStore(audioPlayer: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) =>
          HomePage(audioStore: Modular.get<AudioStore>())),
    ),
  ];
}
