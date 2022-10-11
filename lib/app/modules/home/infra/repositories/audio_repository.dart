import 'package:audio_sextafeira/app/core_module/types/either.dart';
import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/domain/repositories/audio_repository.dart';
import 'package:audio_sextafeira/app/modules/home/exceptions/audio_error.dart';
import 'package:audio_sextafeira/app/modules/home/infra/datasources/audio_datasource.dart';

class AudioRepository implements IAudioRepository {
  final IAudioDatasource datasource;

  AudioRepository({required this.datasource});

  @override
  Future<Either<IAudioException, void>> playAudio(Audio audio) async {
    try {
      final result = await datasource.playAudio(audio);

      return right(result);
    } on IAudioException catch (e) {
      return left(e);
    } catch (e) {
      return left(AudioException(message: e.toString()));
    }
  }

  @override
  Future<Either<IAudioException, void>> stopAudio() async {
    try {
      final result = await datasource.stopAudio();

      return right(result);
    } on IAudioException catch (e) {
      return left(e);
    } catch (e) {
      return left(AudioException(message: e.toString()));
    }
  }
}
