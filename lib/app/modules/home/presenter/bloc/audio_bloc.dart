import 'package:audio_sextafeira/app/modules/home/domain/usecases/stop_audio_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:audio_sextafeira/app/modules/home/domain/usecases/play_audio_usecase.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/bloc/events/audio_events.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/bloc/states/audio_states.dart';

class AudioBloc extends Bloc<AudioEvents, AudioStates> {
  final PlayAudioUseCase playAudioUseCase;
  final StopAudioUseCase stopAudioUseCase;

  AudioBloc({
    required this.playAudioUseCase,
    required this.stopAudioUseCase,
  }) : super(InitialAudioState()) {
    on<PlayAudioEvent>(playAudio);
    on<StopAudioEvent>(stopAudio);
  }

  Future playAudio(PlayAudioEvent event, emit) async {
    emit(LoadingAudioState());

    final result = await playAudioUseCase(event.audio);

    result.fold(
      (l) => emit(ErrorAudioState(message: l.message)),
      (r) => emit(PlayAudioState()),
    );
  }

  Future stopAudio(StopAudioEvent event, emit) async {
    emit(LoadingAudioState());

    final result = await stopAudioUseCase();

    result.fold(
      (l) => emit(ErrorAudioState(message: l.message)),
      (r) => emit(StopAudioState()),
    );
  }
}
