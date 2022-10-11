import 'package:audio_sextafeira/app/modules/home/domain/repositories/audio_repository.dart';
import 'package:audio_sextafeira/app/modules/home/domain/usecases/play_audio_usecase.dart';
import 'package:audio_sextafeira/app/modules/home/domain/usecases/stop_audio_usecase.dart';
import 'package:audio_sextafeira/app/modules/home/external/datasource/audio_datasource.dart';
import 'package:audio_sextafeira/app/modules/home/infra/datasources/audio_datasource.dart';
import 'package:audio_sextafeira/app/modules/home/infra/repositories/audio_repository.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/bloc/audio_bloc.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/home_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [
    //Player
    Bind.singleton((i) => AudioPlayer()),

    //Datasources
    Bind.singleton<IAudioDatasource>(
      (i) => AudioDatasource(audioPlayer: i()),
    ),

    //Repositories
    Bind.factory<IAudioRepository>(
      (i) => AudioRepository(datasource: i()),
    ),

    //Usecases
    Bind.factory<IPlayAudioUseCase>(
      (i) => PlayAudioUseCase(repository: i()),
    ),
    Bind.factory<IStopAudioUseCase>(
      (i) => StopAudioUseCase(repository: i()),
    ),

    //Blocs
    Bind.singleton<AudioBloc>(
      (i) => AudioBloc(
        playAudioUseCase: i(),
        stopAudioUseCase: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => HomePage(
            audioBloc: Modular.get<AudioBloc>(),
          )),
    ),
  ];
}
