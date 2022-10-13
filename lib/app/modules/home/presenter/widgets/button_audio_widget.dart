import 'package:audio_sextafeira/app/modules/home/presenter/mobx/states/audio_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:audio_sextafeira/app/utils/constants.dart';

class ButtonAudioWidget extends StatefulWidget {
  final Audio audio;
  final AudioStore audioStore;
  final int index;
  const ButtonAudioWidget({
    Key? key,
    required this.audio,
    required this.audioStore,
    required this.index,
  }) : super(key: key);

  @override
  State<ButtonAudioWidget> createState() => _ButtonAudioWidgetState();
}

class _ButtonAudioWidgetState extends State<ButtonAudioWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Observer(
          builder: (_) {
            final state = widget.audioStore.state;

            return GestureDetector(
              onTap: () {
                widget.audioStore.playAudio(widget.audio);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.audio.buttonColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  state is PlayAudioState &&
                          widget.audio.filePath == widget.audioStore.audioPlay
                      ? 'assets/images/transparent_button_pressed.png'
                      : 'assets/images/transparent_button_normal.png',
                  width: context.screenWidth * .2,
                ),
              ),
            );
          },
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await widget.audioStore.shareAudio(widget.audio);
              },
              icon: Icon(
                Icons.ios_share_rounded,
                color: AppTheme.colors.primary,
              ),
            ),
            IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.favorite_border_rounded,
                color: AppTheme.colors.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
