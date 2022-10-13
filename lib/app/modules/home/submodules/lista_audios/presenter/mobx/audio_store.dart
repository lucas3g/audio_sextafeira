// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:io';

import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import 'package:path_provider/path_provider.dart';
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
  void playAudio(Audio audio) {
    try {
      if (audioPlay != audio.filePath) {
        emit(PlayAudioState());
        audioPlay = audio.filePath;
        audioPlayer.play(AssetSource(audio.filePath));

        audioPlayer.onPlayerComplete.listen((event) {
          emit(FinishAudioState());
        });
      } else {
        if (state is StopAudioState) {
          emit(PlayAudioState());
          audioPlayer.play(AssetSource(audio.filePath));

          return;
        }
        audioPlayer.stop();
        emit(StopAudioState());
      }
    } catch (e) {
      emit(ErrorAudioState(message: e.toString()));
    }
  }

  @action
  Future shareAudio(Audio audio) async {
    ByteData audioByte = await rootBundle.load('assets/${audio.filePath}');
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/${audio.filePath}';

    File(path).writeAsBytesSync(audioByte.buffer.asUint8List());

    await Share.shareFiles([path]);
  }
}
