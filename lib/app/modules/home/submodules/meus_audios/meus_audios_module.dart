import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/presenter/meus_audios_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MeusAudiosModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => MeusAudiosPage(
            store: Modular.get<MeusAudiosStore>(),
            audioStore: Modular.get<AudioStore>(),
          )),
    ),
  ];
}
