// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meus_audios_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MeusAudiosStore on _MeusAudiosStoreBase, Store {
  late final _$listAudiosAtom =
      Atom(name: '_MeusAudiosStoreBase.listAudios', context: context);

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
      Atom(name: '_MeusAudiosStoreBase._state', context: context);

  @override
  MeusAudiosStates get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(MeusAudiosStates value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$fileAtom =
      Atom(name: '_MeusAudiosStoreBase.file', context: context);

  @override
  File get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$procurarAudioAsyncAction =
      AsyncAction('_MeusAudiosStoreBase.procurarAudio', context: context);

  @override
  Future<dynamic> procurarAudio() {
    return _$procurarAudioAsyncAction.run(() => super.procurarAudio());
  }

  late final _$saveAudioAsyncAction =
      AsyncAction('_MeusAudiosStoreBase.saveAudio', context: context);

  @override
  Future<dynamic> saveAudio() {
    return _$saveAudioAsyncAction.run(() => super.saveAudio());
  }

  late final _$getAllAudiosDBAsyncAction =
      AsyncAction('_MeusAudiosStoreBase.getAllAudiosDB', context: context);

  @override
  Future<dynamic> getAllAudiosDB() {
    return _$getAllAudiosDBAsyncAction.run(() => super.getAllAudiosDB());
  }

  @override
  String toString() {
    return '''
listAudios: ${listAudios},
file: ${file}
    ''';
  }
}
