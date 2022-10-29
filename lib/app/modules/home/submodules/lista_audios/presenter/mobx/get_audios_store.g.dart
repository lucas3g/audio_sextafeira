// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_audios_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAudiosStore on _GetAudiosStoreBase, Store {
  late final _$listAudiosAtom =
      Atom(name: '_GetAudiosStoreBase.listAudios', context: context);

  @override
  ObservableList<Audio> get listAudios {
    _$listAudiosAtom.reportRead();
    return super.listAudios;
  }

  @override
  set listAudios(ObservableList<Audio> value) {
    _$listAudiosAtom.reportWrite(value, super.listAudios, () {
      super.listAudios = value;
    });
  }

  late final _$_stateAtom =
      Atom(name: '_GetAudiosStoreBase._state', context: context);

  @override
  GetAudioStates get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(GetAudioStates value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$getAllAudiosDBAsyncAction =
      AsyncAction('_GetAudiosStoreBase.getAllAudiosDB', context: context);

  @override
  Future<dynamic> getAllAudiosDB() {
    return _$getAllAudiosDBAsyncAction.run(() => super.getAllAudiosDB());
  }

  @override
  String toString() {
    return '''
listAudios: ${listAudios}
    ''';
  }
}
