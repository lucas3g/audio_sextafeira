// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:convert';
import 'dart:io';

import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:audio_sextafeira/app/core_module/services/shared_preferences/adapters/shared_params.dart';
import 'package:audio_sextafeira/app/utils/my_snackbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:audio_sextafeira/app/core_module/services/shared_preferences/local_storage_interface.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';

part 'audio_store.g.dart';

class AudioStore = _AudioStoreBase with _$AudioStore;

abstract class _AudioStoreBase with Store {
  final AudioPlayer audioPlayer;
  final ILocalStorage localStorage;
  late InterstitialAd myInterstital;

  _AudioStoreBase({
    required this.audioPlayer,
    required this.localStorage,
  });

  @observable
  AudioStates _state = InitialAudioState();

  @observable
  String audioPlay = '';

  @observable
  int contador = 0;

  AudioStates get state => _state;

  emit(AudioStates state) {
    _state = state;
  }

  @action
  Future<void> playAudio(Audio audio) async {
    try {
      audioPlayer.setPlaybackRate(1.0);

      if (audioPlay != audio.filePath) {
        if (contador == 2) {
          if (!Platform.isWindows) {
            if (state is PlayAudioState) {
              audioPlayer.stop();
              emit(StopAudioState());
            }

            InterstitialAd.load(
              adUnitId: intersticialID,
              request: const AdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(
                onAdLoaded: (InterstitialAd ad) {
                  myInterstital = ad;

                  myInterstital.show();

                  myInterstital.fullScreenContentCallback =
                      FullScreenContentCallback(
                    onAdDismissedFullScreenContent: (ad) {
                      ad.dispose();
                      myInterstital.dispose();

                      emit(PlayAudioState());

                      audioPlay = audio.filePath;

                      audioPlayer.play(AssetSource(audio.filePath));

                      audioPlayer.onPlayerComplete.listen((event) {
                        emit(FinishAudioState());
                      });
                    },
                    onAdFailedToShowFullScreenContent: (ad, error) {
                      ad.dispose();
                      myInterstital.dispose();
                      debugPrint('Oi ${error.message}');
                    },
                  );
                },
                onAdFailedToLoad: (error) {
                  debugPrint('Oi 2 ${error.message}');
                },
              ),
            );
          }

          contador = 0;
          return;
        } else {
          contador++;
        }

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
  Future stopAudio() async {
    await audioPlayer.stop();
    emit(StopAudioState());
  }

  @action
  Future shareAudio(Audio audio) async {
    MySnackBar(message: 'Carregando audio. Aguarde...');

    ByteData audioByte = await rootBundle.load('assets/${audio.filePath}');
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/${audio.filePath}';

    File(path).writeAsBytesSync(audioByte.buffer.asUint8List());

    await Share.shareFiles([path]);
  }

  @action
  Future<void> favoritar(Audio audio) async {
    late List audios = [];

    if (localStorage.getData('listAudios') != null) {
      final list = jsonDecode(localStorage.getData('listAudios'));
      audios = list;
      audios.add(audio.id);

      await localStorage.setData(
        params: SharedParams(key: 'listAudios', value: audios.toString()),
      );

      return;
    }

    await localStorage.setData(
      params: SharedParams(key: 'listAudios', value: [audio.id].toString()),
    );
  }

  @action
  Future<void> removeFavorito(Audio audio) async {
    late List audios = [];

    if (localStorage.getData('listAudios') != null) {
      final list = jsonDecode(localStorage.getData('listAudios'));
      audios = list;

      if (audios.contains(audio.id)) {
        audios.remove(audio.id);
      }

      await localStorage.setData(
        params: SharedParams(key: 'listAudios', value: audios.toString()),
      );
    }
  }

  @action
  bool verificaFavorito(Audio audio) {
    late List audios = [];

    if (localStorage.getData('listAudios') != null) {
      final list = jsonDecode(localStorage.getData('listAudios'));
      audios = list;

      if (audios.contains(audio.id)) {
        return true;
      }
      return false;
    }

    return false;
  }
}
