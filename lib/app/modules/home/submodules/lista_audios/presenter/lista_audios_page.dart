import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/widgets/button_audio_widget.dart';
import 'package:audio_sextafeira/app/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:mobx/mobx.dart';

class ListaAudiosPage extends StatefulWidget {
  final AudioStore audioStore;
  const ListaAudiosPage({
    Key? key,
    required this.audioStore,
  }) : super(key: key);

  @override
  State<ListaAudiosPage> createState() => _ListaAudiosPageState();
}

class _ListaAudiosPageState extends State<ListaAudiosPage> {
  @override
  void initState() {
    super.initState();

    autorun((_) {
      if (widget.audioStore.state is ErrorAudioState) {
        MySnackBar(message: 'Erro ao tentar reproduzir audio.');
      }
    });
  }

  // @override
  // void dispose() {
  //   Modular.get<AudioPlayer>().dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: listAudios.length,
                itemBuilder: (context, index) {
                  final audio = listAudios[index];
                  return ButtonAudioWidget(
                    audio: audio,
                    audioStore: widget.audioStore,
                    index: index,
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
