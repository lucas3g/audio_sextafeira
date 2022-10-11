import 'package:audio_sextafeira/app/core_module/types/either.dart';
import 'package:audio_sextafeira/app/modules/home/domain/repositories/audio_repository.dart';
import 'package:audio_sextafeira/app/modules/home/exceptions/audio_error.dart';

abstract class IStopAudioUseCase {
  Future<Either<IAudioException, void>> call();
}

class StopAudioUseCase implements IStopAudioUseCase {
  final IAudioRepository repository;

  StopAudioUseCase({required this.repository});

  @override
  Future<Either<IAudioException, void>> call() async {
    return await repository.stopAudio();
  }
}
