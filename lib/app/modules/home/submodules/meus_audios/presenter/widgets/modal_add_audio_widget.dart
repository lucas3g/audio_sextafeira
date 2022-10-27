import 'package:flutter/material.dart';

import 'package:audio_sextafeira/app/core_module/components/widgets/my_input_widget.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';

class ModalAddAudioWidget extends StatefulWidget {
  final MeusAudiosStore store;
  const ModalAddAudioWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<ModalAddAudioWidget> createState() => _ModalAddAudioWidgetState();
}

class _ModalAddAudioWidgetState extends State<ModalAddAudioWidget> {
  final tituloController = TextEditingController();

  final fTitulo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Adicionar novo audio',
            style: AppTheme.textStyles.titleModal,
          ),
          const Divider(),
          MyInputWidget(
            focusNode: fTitulo,
            hintText: 'Digite um titulo',
            label: 'Titulo',
            textEditingController: tituloController,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    await widget.store.procurarAudio();
                  },
                  child: const Text('Procurar audio'),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    await widget.store.saveAudio();
                  },
                  child: const Text('Salvar'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
