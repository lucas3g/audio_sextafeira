import 'package:audio_sextafeira/app/core_module/types/either.dart';
import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/domain/repositories/audio_repository.dart';
import 'package:audio_sextafeira/app/modules/home/exceptions/audio_error.dart';

abstract class IPlayAudioUseCase {
  Future<Either<IAudioException, void>> call(Audio audio);
}

class PlayAudioUseCase implements IPlayAudioUseCase {
  final IAudioRepository repository;

  PlayAudioUseCase({required this.repository});

  @override
  Future<Either<IAudioException, void>> call(Audio audio) async {
    return await repository.playAudio(audio);
  }
}
