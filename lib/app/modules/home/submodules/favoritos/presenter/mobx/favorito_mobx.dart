import 'dart:convert';

import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/favoritos/presenter/mobx/states/favorito_states.dart';
import 'package:mobx/mobx.dart';

import 'package:audio_sextafeira/app/core_module/services/shared_preferences/local_storage_interface.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/domain/entities/audio.dart';

part 'favorito_mobx.g.dart';

class FavoritoStore = _FavoritoStoreBase with _$FavoritoStore;

abstract class _FavoritoStoreBase with Store {
  final ILocalStorage localStorage;

  _FavoritoStoreBase({
    required this.localStorage,
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
  Future<void> loadFav() async {
    try {
      emit(LoadingFavoritoState());

      audiosFav.clear();

      if (localStorage.getData('listAudios') != null) {
        final list = jsonDecode(localStorage.getData('listAudios')) as List;

        for (var audio in listAudios) {
          if (list.contains(audio.id)) {
            audiosFav.add(audio);
          }
        }

        emit(SuccessLoadListState());
      }
    } catch (e) {
      emit(ErrorLoadListState(message: e.toString()));
    }
  }
}
