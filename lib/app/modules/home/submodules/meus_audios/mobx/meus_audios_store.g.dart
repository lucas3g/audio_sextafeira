// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meus_audios_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MeusAudiosStore on _MeusAudiosStoreBase, Store {
  Computed<ObservableList<Audio>>? _$filtredListComputed;

  @override
  ObservableList<Audio> get filtredList => (_$filtredListComputed ??=
          Computed<ObservableList<Audio>>(() => super.filtredList,
              name: '_MeusAudiosStoreBase.filtredList'))
      .value;

  late final _$tituloAtom =
      Atom(name: '_MeusAudiosStoreBase.titulo', context: context);

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  late final _$fileNameAudioAtom =
      Atom(name: '_MeusAudiosStoreBase.fileNameAudio', context: context);

  @override
  String get fileNameAudio {
    _$fileNameAudioAtom.reportRead();
    return super.fileNameAudio;
  }

  @override
  set fileNameAudio(String value) {
    _$fileNameAudioAtom.reportWrite(value, super.fileNameAudio, () {
      super.fileNameAudio = value;
    });
  }

  late final _$clicouDeletarAtom =
      Atom(name: '_MeusAudiosStoreBase.clicouDeletar', context: context);

  @override
  bool get clicouDeletar {
    _$clicouDeletarAtom.reportRead();
    return super.clicouDeletar;
  }

  @override
  set clicouDeletar(bool value) {
    _$clicouDeletarAtom.reportWrite(value, super.clicouDeletar, () {
      super.clicouDeletar = value;
    });
  }

  late final _$pesquisarAtom =
      Atom(name: '_MeusAudiosStoreBase.pesquisar', context: context);

  @override
  bool get pesquisar {
    _$pesquisarAtom.reportRead();
    return super.pesquisar;
  }

  @override
  set pesquisar(bool value) {
    _$pesquisarAtom.reportWrite(value, super.pesquisar, () {
      super.pesquisar = value;
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

  late final _$idAudioAtom =
      Atom(name: '_MeusAudiosStoreBase.idAudio', context: context);

  @override
  int get idAudio {
    _$idAudioAtom.reportRead();
    return super.idAudio;
  }

  @override
  set idAudio(int value) {
    _$idAudioAtom.reportWrite(value, super.idAudio, () {
      super.idAudio = value;
    });
  }

  late final _$filtroAtom =
      Atom(name: '_MeusAudiosStoreBase.filtro', context: context);

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
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
  Future<bool> saveAudio(String title) {
    return _$saveAudioAsyncAction.run(() => super.saveAudio(title));
  }

  late final _$getAllAudiosDBAsyncAction =
      AsyncAction('_MeusAudiosStoreBase.getAllAudiosDB', context: context);

  @override
  Future<dynamic> getAllAudiosDB() {
    return _$getAllAudiosDBAsyncAction.run(() => super.getAllAudiosDB());
  }

  late final _$deleteAudioAsyncAction =
      AsyncAction('_MeusAudiosStoreBase.deleteAudio', context: context);

  @override
  Future<dynamic> deleteAudio(Audio audio) {
    return _$deleteAudioAsyncAction.run(() => super.deleteAudio(audio));
  }

  late final _$getDadosAudioAsyncAction =
      AsyncAction('_MeusAudiosStoreBase.getDadosAudio', context: context);

  @override
  Future<dynamic> getDadosAudio(int idAudio) {
    return _$getDadosAudioAsyncAction.run(() => super.getDadosAudio(idAudio));
  }

  late final _$changeTitleAsyncAction =
      AsyncAction('_MeusAudiosStoreBase.changeTitle', context: context);

  @override
  Future<dynamic> changeTitle(int idAudio, String title) {
    return _$changeTitleAsyncAction
        .run(() => super.changeTitle(idAudio, title));
  }

  late final _$_MeusAudiosStoreBaseActionController =
      ActionController(name: '_MeusAudiosStoreBase', context: context);

  @override
  void clicouPesquisar() {
    final _$actionInfo = _$_MeusAudiosStoreBaseActionController.startAction(
        name: '_MeusAudiosStoreBase.clicouPesquisar');
    try {
      return super.clicouPesquisar();
    } finally {
      _$_MeusAudiosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titulo: ${titulo},
fileNameAudio: ${fileNameAudio},
clicouDeletar: ${clicouDeletar},
pesquisar: ${pesquisar},
file: ${file},
listAudios: ${listAudios},
idAudio: ${idAudio},
filtro: ${filtro},
filtredList: ${filtredList}
    ''';
  }
}
