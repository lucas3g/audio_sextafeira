import 'package:audio_sextafeira/app/core_module/components/widgets/my_input_widget.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/states/meus_audios_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:audio_sextafeira/app/core_module/components/widgets/button_audio_widget.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/presenter/widgets/modal_add_audio_widget.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MeusAudiosPage extends StatefulWidget {
  final MeusAudiosStore store;
  final AudioStore audioStore;

  const MeusAudiosPage({
    Key? key,
    required this.store,
    required this.audioStore,
  }) : super(key: key);

  @override
  State<MeusAudiosPage> createState() => _MeusAudiosPageState();
}

class _MeusAudiosPageState extends State<MeusAudiosPage>
    with SingleTickerProviderStateMixin {
  final searchController = TextEditingController();

  final fPesquisa = FocusNode();

  final Animation<Offset> _animation = Modular.args.data['animation'];

  Future getAllAudios() async {
    await widget.store.getAllAudiosDB();
  }

  @override
  void initState() {
    super.initState();

    getAllAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Observer(builder: (context) {
              return Visibility(
                visible: widget.store.pesquisar,
                child: SlideTransition(
                  position: _animation,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MyInputWidget(
                      focusNode: fPesquisa,
                      hintText: 'Digite o titulo do audio',
                      label: 'Pesquisar',
                      textEditingController: searchController,
                      onChanged: (String? value) async {
                        widget.store.title = value!;
                      },
                    ),
                  ),
                ),
              );
            }),
            Observer(builder: (context) {
              final state = widget.store.state;

              if (state is LoadingMeusAudiosStates) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              }

              final audios = widget.store.filtredList;

              if (audios.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      'Nenhum audio encontrado.',
                      style: AppTheme.textStyles.titleAppBar,
                    ),
                  ),
                );
              }

              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: audios.length,
                  itemBuilder: (context, index) {
                    final audio = audios[index];

                    return ButtonAudioWidget(
                      audio: audio,
                      audioStore: widget.audioStore,
                      index: index,
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 10,
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return ModalAddAudioWidget(store: widget.store);
            },
          );

          await widget.store.getAllAudiosDB();
        },
        child: Icon(
          Icons.add,
          color: AppTheme.colors.primary,
        ),
      ),
    );
  }
}
