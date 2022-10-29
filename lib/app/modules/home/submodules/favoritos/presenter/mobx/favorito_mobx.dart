import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/filter_entity.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/tables.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/sqflite_storage_interface.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/favoritos/presenter/mobx/states/favorito_states.dart';
import 'package:mobx/mobx.dart';

import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';

part 'favorito_mobx.g.dart';

class FavoritoStore = _FavoritoStoreBase with _$FavoritoStore;

abstract class _FavoritoStoreBase with Store {
  final ISQLFliteStorage db;

  _FavoritoStoreBase({
    required this.db,
  });

  @observable
  ObservableList<Audio> audiosFav = ObservableList.of([]);

  @observable
  FavoritoStates _state = InitialFavoritoState();

  FavoritoStates get state => _state;

  emit(FavoritoStates state) {
    _state = state;
  }

  @action
  Future getFavoritos() async {
    try {
      emit(LoadingFavoritoState());

      const filters =
          FilterEntity(name: 'favorito', value: 1, type: FilterType.equal);

      final params = SQLFliteGetPerFilterParam(
          table: Tables.meus_audios, filters: {filters});

      final result = await db.getPerFilter(params);

      final List<Audio> list = List.from(result.map(Audio.toEntity).toList());

      list.sort((a, b) => b.id.compareTo(a.id));

      audiosFav = ObservableList.of(list);

      emit(SuccessLoadListState());
    } catch (e) {
      emit(ErrorLoadListState(message: e.toString()));
    }
  }
}
