import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:flutter/animation.dart';

class Audio {
  final int id;
  final String name;
  final String filePath;
  final Color buttonColor;

  Audio({
    required this.id,
    required this.name,
    required this.filePath,
    required this.buttonColor,
  });

  static toEntity(dynamic map) {
    return Audio(
      id: map['id'],
      name: map['title'],
      filePath: map['path_file'],
      buttonColor: randomColor(),
    );
  }
}
