// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:audio_sextafeira/app/utils/my_snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:mobx/mobx.dart';
part 'meus_audios_store.g.dart';

class MeusAudiosStore = _MeusAudiosStoreBase with _$MeusAudiosStore;

abstract class _MeusAudiosStoreBase with Store {
  @observable
  late File file = File('');

  @action
  Future procurarAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'aac',
        'midi',
        'mp3',
        'mpeg',
        'ogg',
        'wav',
      ],
    );

    if (result != null) {
      file = File(result.files.single.path!);
    }
  }

  @action
  Future saveAudio() async {
    try {
      if (file.path.isNotEmpty) {
        final audio = await file.readAsBytes();

        final name = file.path.split('\\').last.split('.').first;

        final result = await FileSaver.instance.saveFile(name, audio, 'mp3');

        if (!result.contains('Something went wrong')) {
          MySnackBar(message: 'Audio salvo com sucesso!');
        } else {
          MySnackBar(message: 'Erro ao tentar salvar audio!');
        }
      }
    } catch (e) {
      MySnackBar(message: e.toString());
    }
  }
}
