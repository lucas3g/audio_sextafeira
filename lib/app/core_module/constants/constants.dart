import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

const baseUrl = String.fromEnvironment('BASE_URL');
const baseUrlLicense = String.fromEnvironment('BASE_URL_LICENSE');

Color randomColor() {
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.indigo,
    Colors.lime,
    Colors.orange,
    Colors.teal,
  ];

  return colors[math.Random().nextInt(colors.length)];
}

final List<Audio> listAudios = [
  Audio(
    name: 'Uhuul bom dia',
    filePath: 'audios/uhulbomdia.mp3',
    buttonColor: randomColor(),
  ),
  Audio(
    name: 'Falta muito pra chegar sexta?',
    filePath: 'audios/faltamuitosexta.mp3',
    buttonColor: randomColor(),
  ),
  Audio(
    name: 'Tão pronto pro gole de hoje?',
    filePath: 'audios/taoprontogole.mp3',
    buttonColor: randomColor(),
  ),
  Audio(
    name: 'Chegou a sexta diabedo',
    filePath: 'audios/chegouasextadiabedo.mp3',
    buttonColor: randomColor(),
  ),
  Audio(
    name: 'É gurizada sexta-feira',
    filePath: 'audios/ehgurizadasextafeira.mp3',
    buttonColor: randomColor(),
  ),
  Audio(
    name: 'Ai tu acordo pia',
    filePath: 'audios/aituacordopia.mp3',
    buttonColor: randomColor(),
  ),
];
