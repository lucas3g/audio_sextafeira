import 'package:flutter/material.dart';

import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/widgets/button_audio_widget.dart';

class HomePage extends StatefulWidget {
  final AudioStore audioStore;
  const HomePage({
    Key? key,
    required this.audioStore,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audios para Sexta Feira'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Lista de Audios'),
            const Divider(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  crossAxisCount: 3,
                ),
                itemCount: listAudios.length,
                itemBuilder: (context, index) {
                  final audio = listAudios[index];
                  return ButtonAudioWidget(
                    audio: audio,
                    audioStore: widget.audioStore,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
