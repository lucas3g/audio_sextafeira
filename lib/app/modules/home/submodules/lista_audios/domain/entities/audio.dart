// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:flutter/animation.dart';

class Audio {
  final int id;
  final String name;
  final String filePath;
  final Color buttonColor;
  final bool assets;
  final bool favorito;

  Audio({
    required this.id,
    required this.name,
    required this.filePath,
    required this.buttonColor,
    required this.assets,
    required this.favorito,
  });

  static toEntity(dynamic map) {
    return Audio(
      id: int.parse(map['id'].toString()),
      name: map['title'],
      filePath: map['path_file'],
      buttonColor: Color(
          int.tryParse(map['buttonColor'].toString()) ?? randomColor().value),
      assets: int.parse(map['assets'].toString()) == 0 ? false : true,
      favorito: int.parse(map['favorito'].toString()) == 0 ? false : true,
    );
  }
}
