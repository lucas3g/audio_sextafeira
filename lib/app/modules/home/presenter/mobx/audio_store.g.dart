// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AudioStore on _AudioStoreBase, Store {
  late final _$_stateAtom =
      Atom(name: '_AudioStoreBase._state', context: context);

  @override
  AudioStates get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(AudioStates value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$audioPlayAtom =
      Atom(name: '_AudioStoreBase.audioPlay', context: context);

  @override
  String get audioPlay {
    _$audioPlayAtom.reportRead();
    return super.audioPlay;
  }

  @override
  set audioPlay(String value) {
    _$audioPlayAtom.reportWrite(value, super.audioPlay, () {
      super.audioPlay = value;
    });
  }

  late final _$playAudioAsyncAction =
      AsyncAction('_AudioStoreBase.playAudio', context: context);

  @override
  Future<dynamic> playAudio(Audio audio) {
    return _$playAudioAsyncAction.run(() => super.playAudio(audio));
  }

  late final _$shareAudioAsyncAction =
      AsyncAction('_AudioStoreBase.shareAudio', context: context);

  @override
  Future<dynamic> shareAudio(Audio audio) {
    return _$shareAudioAsyncAction.run(() => super.shareAudio(audio));
  }

  @override
  String toString() {
    return '''
audioPlay: ${audioPlay}
    ''';
  }
}
