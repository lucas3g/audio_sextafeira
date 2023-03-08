// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/presenter/widgets/modal_add_audio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:audio_sextafeira/app/modules/home/submodules/favoritos/presenter/mobx/favorito_mobx.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/get_audios_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:audio_sextafeira/app/utils/constants.dart';
import 'package:line_icons/line_icons.dart';

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
  final favoritoStore = Modular.get<FavoritoStore>();
  final getAudioStore = Modular.get<GetAudiosStore>();
  final meusAudioStore = Modular.get<MeusAudiosStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            offset: Offset(5, 7),
          )
        ],
      ),
      child: Observer(builder: (_) {
        final state = widget.audioStore.state;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                widget.audioStore.playAudio(widget.audio);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.audio.buttonColor,
                  borderRadius:
                      BorderRadius.circular((context.screenWidth * .5)),
                ),
                child: Image.asset(
                  state is PlayAudioState &&
                          widget.audio.filePath == widget.audioStore.audioPlay
                      ? 'assets/images/transparent_button_pressed.png'
                      : 'assets/images/transparent_button_normal.png',
                  width: context.screenWidth * .2,
                ),
              ),
            ),
            Constants.currentIndex == 1
                ? Text(
                    widget.audio.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )
                : Expanded(
                    child: Text(
                      widget.audio.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
            const Divider(),
            Expanded(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: Constants.currentIndex == 1 ? 2 : 1.2,
                children: [
                  IconButton(
                    onPressed: () async {
                      await widget.audioStore.shareAudio(widget.audio);
                    },
                    icon: Icon(
                      LineIcons.whatSApp,
                      color: AppTheme.colors.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await widget.audioStore.favoritar(widget.audio);

                      await getAudioStore.getAllAudiosDB();

                      await meusAudioStore.getAllAudiosDB();

                      await favoritoStore.getFavoritos();
                    },
                    icon: Icon(
                      widget.audio.favorito
                          ? Icons.star_outlined
                          : Icons.star_border_outlined,
                      color: AppTheme.colors.primary,
                    ),
                  ),
                  Visibility(
                    visible:
                        !widget.audio.assets && Constants.currentIndex == 1,
                    child: IconButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return ModalAddAudioWidget(
                              store: meusAudioStore,
                              idAudio: widget.audio.id,
                            );
                          },
                        );

                        await meusAudioStore.getAllAudiosDB();
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ),
                  Visibility(
                    visible:
                        !widget.audio.assets && Constants.currentIndex == 1,
                    child: IconButton(
                      onPressed: () async {
                        await meusAudioStore.deleteAudio(widget.audio);
                      },
                      icon: Icon(
                        meusAudioStore.clicouDeletar &&
                                widget.audio.id == meusAudioStore.idAudio
                            ? Icons.done
                            : Icons.delete_outline_rounded,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
