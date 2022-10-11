import 'package:audio_sextafeira/app/modules/home/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/bloc/events/audio_events.dart';
import 'package:audio_sextafeira/app/modules/home/presenter/bloc/states/audio_states.dart';
import 'package:flutter/material.dart';

import 'package:audio_sextafeira/app/modules/home/presenter/bloc/audio_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final AudioBloc audioBloc;
  const HomePage({
    Key? key,
    required this.audioBloc,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Audio auxAudio;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      BlocBuilder<AudioBloc, AudioStates>(
                          bloc: widget.audioBloc,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () async {
                                final audio = Audio(
                                  name: '',
                                  filePath: 'audios/uhulbomdia.mp3',
                                );

                                setState(() {});

                                if (state is PlayAudioState) {
                                  widget.audioBloc.add(StopAudioEvent());

                                  if (auxAudio.filePath != audio.filePath) {
                                    widget.audioBloc
                                        .add(PlayAudioEvent(audio: audio));
                                  }

                                  return;
                                }

                                auxAudio = audio;

                                setState(() {});

                                widget.audioBloc
                                    .add(PlayAudioEvent(audio: audio));
                              },
                              child: Image.asset(
                                'assets/images/play.jpeg',
                                width: 100,
                              ),
                            );
                          }),
                      const Text('Uhuul bom dia'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      BlocBuilder<AudioBloc, AudioStates>(
                          bloc: widget.audioBloc,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () async {
                                final audio = Audio(
                                  name: '',
                                  filePath: 'audios/audio2.mp3',
                                );

                                setState(() {});

                                if (state is PlayAudioState) {
                                  widget.audioBloc.add(StopAudioEvent());

                                  if (auxAudio.filePath != audio.filePath) {
                                    widget.audioBloc
                                        .add(PlayAudioEvent(audio: audio));
                                  }

                                  return;
                                }

                                auxAudio = audio;

                                setState(() {});

                                widget.audioBloc
                                    .add(PlayAudioEvent(audio: audio));
                              },
                              child: Image.asset(
                                'assets/images/play.jpeg',
                                width: 100,
                              ),
                            );
                          }),
                      const Text('Falta muito pra chegar sexta'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/play.jpeg',
                          width: 100,
                        ),
                      ),
                      const Text('Uhuul bom dia'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
