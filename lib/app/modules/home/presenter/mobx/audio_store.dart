import 'package:audioplayers/audioplayers.dart';
import 'package:cross_file/cross_file.dart';
import 'package:mobx/mobx.dart';

import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/mobx/states/audio_states.dart';
import 'package:share_plus/share_plus.dart';

part 'audio_store.g.dart';

class AudioStore = _AudioStoreBase with _$AudioStore;

abstract class _AudioStoreBase with Store {
  final AudioPlayer audioPlayer;

  _AudioStoreBase({
    required this.audioPlayer,
  });

  @observable
  AudioStates _state = InitialAudioState();

  @observable
  String audioPlay = '';

  AudioStates get state => _state;

  emit(AudioStates state) {
    _state = state;
  }

  @action
  Future playAudio(Audio audio) async {
    if (audioPlay != audio.filePath) {
      emit(PlayAudioState());
      audioPlay = audio.filePath;
      await audioPlayer.play(AssetSource(audio.filePath));

      audioPlayer.onPlayerComplete.listen((event) {
        emit(FinishAudioState());
      });
    } else {
      if (state is StopAudioState) {
        emit(PlayAudioState());
        await audioPlayer.play(AssetSource(audio.filePath));

        return;
      }
      await audioPlayer.stop();
      emit(StopAudioState());
    }
  }

  @action
  Future shareAudio(Audio audio) async {
    final file = [XFile(audio.filePath)];
    await Share.shareXFiles(file);
  }
}
