// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/tables.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/sqflite_storage_interface.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/states/meus_audios_states.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:mobx/mobx.dart';

import 'package:audio_sextafeira/app/utils/my_snackbar.dart';

part 'meus_audios_store.g.dart';

class MeusAudiosStore = _MeusAudiosStoreBase with _$MeusAudiosStore;

abstract class _MeusAudiosStoreBase with Store {
  final ISQLFliteStorage db;

  _MeusAudiosStoreBase({
    required this.db,
  });

  @observable
  ObservableList<Audio> listAudios = ObservableList.of([]);

  @observable
  MeusAudiosStates _state = InitialMeusAudiosStates();

  MeusAudiosStates get state => _state;

  emit(MeusAudiosStates state) {
    _state = state;
  }

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
  Future saveAudio(String title) async {
    try {
      if (file.path.isNotEmpty) {
        final audio = await file.readAsBytes();

        final name = file.path.split('/').last.split('.').first;

        final result = await FileSaver.instance.saveFile(name, audio, 'mp3');

        if (!result.contains('Something went wrong')) {
          final params = SQLFliteInsertParam(
            table: Tables.meus_audios,
            data: {
              'title': title,
              'path_file': result,
            },
          );

          await db.create(params);
          MySnackBar(message: 'Audio salvo com sucesso!');
        } else {
          MySnackBar(message: 'Erro ao tentar salvar audio!');
        }
      }
    } catch (e) {
      MySnackBar(message: e.toString());
    }
  }

  @action
  Future getAllAudiosDB() async {
    try {
      emit(LoadingMeusAudiosStates());
      final params = SQLFliteGetAllParam(table: Tables.meus_audios);

      final result = await db.getAll(params);

      await Future.delayed(const Duration(milliseconds: 300));

      final List<Audio> list = List.from(result.map(Audio.toEntity).toList());

      list.sort((a, b) => b.id.compareTo(a.id));

      listAudios = ObservableList.of(list);

      emit(SuccessMeusAudiosStates());
    } catch (e) {
      emit(ErrorMeusAudiosStates(message: e.toString()));
    }
  }
}
