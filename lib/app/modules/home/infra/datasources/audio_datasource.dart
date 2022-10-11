import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';

abstract class IAudioDatasource {
  Future<void> playAudio(Audio audio);
  Future<void> stopAudio();
}
