import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:audio_sextafeira/app/core_module/components/widgets/button_audio_widget.dart';
import 'package:audio_sextafeira/app/core_module/components/widgets/my_input_widget.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/presenter/widgets/modal_add_audio_widget.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';

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

class _MeusAudiosPageState extends State<MeusAudiosPage> {
  final searchController = TextEditingController();

  final fPesquisa = FocusNode();

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
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MyInputWidget(
                focusNode: fPesquisa,
                hintText: 'Digite o titulo do audio',
                label: 'Pesquisar',
                textEditingController: searchController,
              ),
            ),
            Observer(builder: (context) {
              final audios = widget.store.listAudios;

              if (audios.isEmpty) {
                return const Center(
                  child: Text('Nenhum audio encontrado'),
                );
              }

              audios.sort((a, b) => b.id.compareTo(a.id));

              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.56,
                    crossAxisCount: 3,
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return ModalAddAudioWidget(store: widget.store);
            },
          );
        },
        child: Icon(
          Icons.add,
          color: AppTheme.colors.primary,
        ),
      ),
    );
  }
}
