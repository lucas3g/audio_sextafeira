// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:io';
import 'dart:typed_data';

import 'package:audience_network/audience_network.dart';
import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/tables.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/sqflite_storage_interface.dart';
import 'package:audio_sextafeira/app/utils/my_snackbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';

part 'audio_store.g.dart';

class AudioStore = _AudioStoreBase with _$AudioStore;

abstract class _AudioStoreBase with Store {
  final AudioPlayer audioPlayer;
  final ISQLFliteStorage db;

  _AudioStoreBase({
    required this.audioPlayer,
    required this.db,
  });

  @observable
  AudioStates _state = InitialAudioState();

  @observable
  String audioPlay = '';

  @observable
  bool set2x = false;

  @observable
  int contador = 0;

  AudioStates get state => _state;

  emit(AudioStates state) {
    _state = state;
  }

  @action
  Future<void> playAudio(Audio audio) async {
    try {
      set2x = false;
      audioPlayer.setPlaybackRate(1.0);

      if (audioPlay != audio.filePath) {
        if (!Platform.isWindows) {
          if (contador == 2) {
            if (state is PlayAudioState) {
              audioPlayer.stop();
              emit(StopAudioState());
            }

            final ad = InterstitialAd(intersticialID);

            ad.listener = InterstitialAdListener(
              onDismissed: () {
                ad.destroy();

                emit(PlayAudioState());

                audioPlay = audio.filePath;

                if (audioPlay.contains('audios')) {
                  audioPlayer.play(AssetSource(audio.filePath));
                } else {
                  audioPlayer.play(DeviceFileSource(audio.filePath));
                }

                audioPlayer.onPlayerComplete.listen((event) {
                  emit(FinishAudioState());
                });
              },
              onLoaded: () {
                ad.show();
              },
            );

            ad.load();

            contador = 0;
            return;
          } else {
            contador++;
          }
        }

        emit(PlayAudioState());
        audioPlay = audio.filePath;

        if (audio.assets) {
          audioPlayer.play(AssetSource(audio.filePath));
        } else {
          audioPlayer.play(DeviceFileSource(audio.filePath));
        }

        audioPlayer.onPlayerComplete.listen((event) {
          emit(FinishAudioState());
        });
      } else {
        if (state is StopAudioState) {
          emit(PlayAudioState());

          if (audio.assets) {
            audioPlayer.play(AssetSource(audio.filePath));
          } else {
            audioPlayer.play(DeviceFileSource(audio.filePath));
          }

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
  void setSpeedAudio() {
    if (set2x) {
      audioPlayer.setPlaybackRate(1.0);
    } else {
      audioPlayer.setPlaybackRate(2.0);
    }

    set2x = !set2x;
  }

  @action
  Future stopAudio() async {
    await audioPlayer.stop();
    emit(StopAudioState());
  }

  @action
  Future pauseResumeAudio() async {
    if (state is PauseAudioState) {
      await audioPlayer.resume();
      emit(PlayAudioState());
      return;
    }
    await audioPlayer.pause();
    emit(PauseAudioState());
  }

  @action
  Future shareAudio(Audio audio) async {
    try {
      MySnackBar(message: 'Carregando audio. Aguarde...');

      TypedData audioByte;
      late String path;

      if (audio.assets) {
        final temp = await getTemporaryDirectory();
        path = '${temp.path}/${audio.filePath}';
        audioByte = await rootBundle.load('assets/${audio.filePath}');
      } else {
        audioByte = await File(audio.filePath).readAsBytes();
        path = audio.filePath;
      }

      File(path).writeAsBytesSync(audioByte.buffer.asUint8List());

      await Share.shareFiles([path]);
    } catch (e) {
      MySnackBar(message: e.toString());
    }
  }

  @action
  Future<void> favoritar(Audio audio) async {
    final params = SQLFliteUpdateParam(
      table: Tables.meus_audios,
      id: audio.id,
      field: 'favorito',
      value: audio.favorito ? 0 : 1,
    );

    await db.update(params);
  }
}
