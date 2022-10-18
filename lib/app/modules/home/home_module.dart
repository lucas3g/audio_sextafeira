import 'package:audio_sextafeira/app/modules/home/presenter/home_page.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/favoritos/favorito_module.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/favoritos/presenter/mobx/favorito_mobx.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/lista_audios_module.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

ModuleRoute configuraModule(
  String name, {
  required Module module,
  TransitionType? transition,
  CustomTransition? customTransition,
  Duration? duration,
  List<RouteGuard> guards = const [],
}) {
  return ModuleRoute(
    name,
    transition: TransitionType.noTransition,
    module: module,
  );
}

Widget animationPage(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  late double begin = 0;

  const end = 1.0;
  const curve = Curves.fastOutSlowIn;

  final tween = Tween(begin: begin, end: end);

  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );

  return FadeTransition(
    opacity: tween.animate(curvedAnimation),
    child: child,
  );
}

class HomeModule extends Module {
  @override
  final List<Module> imports = [
    ListaAudioModule(),
    FavoritoModule(),
  ];

  @override
  final List<Bind<Object>> binds = [
    //Player
    Bind.singleton(
      (i) => AudioPlayer(),
    ),

    //Mobx
    Bind.factory<AudioStore>(
      (i) => AudioStore(audioPlayer: i(), localStorage: i()),
    ),

    Bind.singleton<FavoritoStore>(
      (i) => FavoritoStore(localStorage: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => const HomePage()),
      children: [
        configuraModule('/lista', module: ListaAudioModule()),
        configuraModule('/favorito', module: FavoritoModule()),
      ],
    ),
  ];
}
