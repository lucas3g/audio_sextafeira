import 'package:flutter/material.dart';

import 'package:audio_sextafeira/app/core_module/components/widgets/my_input_widget.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/presenter/widgets/modal_add_audio_widget.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';

class MeusAudiosPage extends StatefulWidget {
  final MeusAudiosStore store;
  const MeusAudiosPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<MeusAudiosPage> createState() => _MeusAudiosPageState();
}

class _MeusAudiosPageState extends State<MeusAudiosPage> {
  final searchController = TextEditingController();

  final fPesquisa = FocusNode();

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
