import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/utils/constants.dart';

class ButtonAudioWidget extends StatefulWidget {
  final Audio audio;
  final AudioStore audioStore;
  const ButtonAudioWidget({
    Key? key,
    required this.audio,
    required this.audioStore,
  }) : super(key: key);

  @override
  State<ButtonAudioWidget> createState() => _ButtonAudioWidgetState();
}

class _ButtonAudioWidgetState extends State<ButtonAudioWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(builder: (_) {
          return InkWell(
            onTap: () async {
              await widget.audioStore.playAudio(widget.audio);
            },
            child: Image.asset(
              'assets/images/play.jpeg',
              width: context.screenWidth * .2,
            ),
          );
        }),
        Row(
          children: [
            Expanded(
              child: Text(
                widget.audio.name,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
