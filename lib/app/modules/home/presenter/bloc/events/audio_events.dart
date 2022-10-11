import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';

abstract class AudioEvents {}

class PlayAudioEvent extends AudioEvents {
  final Audio audio;

  PlayAudioEvent({
    required this.audio,
  });
}

class StopAudioEvent extends AudioEvents {}
