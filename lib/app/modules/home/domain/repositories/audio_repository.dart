import 'package:audio_sextafeira/app/core_module/types/either.dart';
import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/exceptions/audio_error.dart';

abstract class IAudioRepository {
  Future<Either<IAudioException, void>> playAudio(Audio audio);
  Future<Either<IAudioException, void>> stopAudio();
}
