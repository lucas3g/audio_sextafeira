// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';

import 'package:audio_sextafeira/app/core_module/constants/constants.dart';

class Audio {
  final int id;
  final String name;
  final String filePath;
  final Color buttonColor;
  final bool assets;

  Audio({
    required this.id,
    required this.name,
    required this.filePath,
    required this.buttonColor,
    required this.assets,
  });

  static toEntity(dynamic map) {
    return Audio(
      id: map['id'],
      name: map['title'],
      filePath: map['path_file'],
      buttonColor: randomColor(),
      assets: map['assets'] ?? false,
    );
  }
}
