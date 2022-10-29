import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/filter_entity.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/tables.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';
import 'package:mobx/mobx.dart';

import 'package:audio_sextafeira/app/core_module/services/sqflite/sqflite_storage_interface.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';

part 'get_audios_store.g.dart';

class GetAudiosStore = _GetAudiosStoreBase with _$GetAudiosStore;

abstract class _GetAudiosStoreBase with Store {
  final ISQLFliteStorage db;

  _GetAudiosStoreBase({
    required this.db,
  });

  @observable
  ObservableList<Audio> listAudios = ObservableList.of([]);

  @observable
  GetAudioStates _state = GetInitialAudioState();

  GetAudioStates get state => _state;

  emit(GetAudioStates state) {
    _state = state;
  }

  @action
  Future getAllAudiosDB() async {
    try {
      emit(GetLoadingAudioState());

      const filter =
          FilterEntity(name: 'assets', value: 1, type: FilterType.equal);

      final params = SQLFliteGetPerFilterParam(
        table: Tables.meus_audios,
        filters: {filter},
      );

      final result = await db.getPerFilter(params);

      await Future.delayed(const Duration(milliseconds: 300));

      final List<Audio> list = List.from(result.map(Audio.toEntity).toList());

      list.sort((a, b) => b.id.compareTo(a.id));

      listAudios = ObservableList.of(list);

      emit(GetSuccesAudioState());
    } catch (e) {
      emit(GetErrorAudioState(message: e.toString()));
    }
  }
}
