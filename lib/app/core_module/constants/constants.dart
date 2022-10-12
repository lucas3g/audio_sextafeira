import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';

const baseUrl = String.fromEnvironment('BASE_URL');
const baseUrlLicense = String.fromEnvironment('BASE_URL_LICENSE');

final List<Audio> listAudios = [
  Audio(
    name: 'Uhuul bom dia',
    filePath: 'audios/uhulbomdia.mp3',
  ),
  Audio(
    name: 'Falta muito pra chegar sexta?',
    filePath: 'audios/faltamuitosexta.mp3',
  ),
  Audio(
    name: 'Tão pronto pro gole hoje?',
    filePath: 'audios/taoprontogole.mp3',
  ),
  Audio(
    name: 'Tão pronto pro gole hoje?',
    filePath: 'audios/taoprontogole.mp3',
  ),
  Audio(
    name: 'Tão pronto pro gole hoje?',
    filePath: 'audios/taoprontogole.mp3',
  ),
];
