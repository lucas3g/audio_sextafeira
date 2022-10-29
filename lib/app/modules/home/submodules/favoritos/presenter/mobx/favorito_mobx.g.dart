// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorito_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritoStore on _FavoritoStoreBase, Store {
  late final _$audiosFavAtom =
      Atom(name: '_FavoritoStoreBase.audiosFav', context: context);

  @override
  ObservableList<Audio> get audiosFav {
    _$audiosFavAtom.reportRead();
    return super.audiosFav;
  }

  @override
  set audiosFav(ObservableList<Audio> value) {
    _$audiosFavAtom.reportWrite(value, super.audiosFav, () {
      super.audiosFav = value;
    });
  }

  late final _$_stateAtom =
      Atom(name: '_FavoritoStoreBase._state', context: context);

  @override
  FavoritoStates get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(FavoritoStates value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$getFavoritosAsyncAction =
      AsyncAction('_FavoritoStoreBase.getFavoritos', context: context);

  @override
  Future<dynamic> getFavoritos() {
    return _$getFavoritosAsyncAction.run(() => super.getFavoritos());
  }

  @override
  String toString() {
    return '''
audiosFav: ${audiosFav}
    ''';
  }
}
