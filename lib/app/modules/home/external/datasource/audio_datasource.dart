import 'package:audioplayers/audioplayers.dart';

import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/infra/datasources/audio_datasource.dart';

class AudioDatasource implements IAudioDatasource {
  final AudioPlayer audioPlayer;

  AudioDatasource({required this.audioPlayer});

  @override
  Future<void> playAudio(Audio audio) async {
    await audioPlayer.play(AssetSource(audio.filePath));
  }

  @override
  Future<void> stopAudio() async {
    await audioPlayer.stop();
  }
}
