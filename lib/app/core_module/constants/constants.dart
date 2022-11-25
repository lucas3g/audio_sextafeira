import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

const baseUrl = String.fromEnvironment('BASE_URL');
const baseUrlLicense = String.fromEnvironment('BASE_URL_LICENSE');

const bannerID = '3438234189739575_3438248803071447';
const intersticialID = '3438234189739575_3438249026404758';

Color randomColor() {
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.lime,
    Colors.orange,
    Colors.teal,
  ];

  return colors[math.Random().nextInt(colors.length)];
}

final List<Audio> listAudios = [
  Audio(
    id: -11,
    name: 'Começa a passa aquela adrenalina',
    filePath: 'audios/comecaapassa.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -10,
    name: 'Imagina uma sexta feira',
    filePath: 'audios/imageumasexta.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -9,
    name: 'Eu tenho rainike, band',
    filePath: 'audios/emilde.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -8,
    name: 'Só mai mei dia',
    filePath: 'audios/somaimedia.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -7,
    name: 'Mais meio dia!!',
    filePath: 'audios/maismediodia.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -6,
    name: 'Uhuul bom dia',
    filePath: 'audios/uhulbomdia.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -5,
    name: 'Falta muito pra chegar sexta?',
    filePath: 'audios/faltamuitosexta.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -4,
    name: 'Tão pronto pro gole de hoje?',
    filePath: 'audios/taoprontogole.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -3,
    name: 'Chegou a sexta diabedo',
    filePath: 'audios/chegouasextadiabedo.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -2,
    name: 'É gurizada sexta-feira',
    filePath: 'audios/ehgurizadasextafeira.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
  Audio(
    id: -1,
    name: 'Ai tu acordo pia',
    filePath: 'audios/aituacordopia.mp3',
    buttonColor: randomColor(),
    assets: true,
    favorito: false,
  ),
];
