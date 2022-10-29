abstract class AudioStates {}

class InitialAudioState extends AudioStates {}

class PlayAudioState extends AudioStates {}

class FinishAudioState extends AudioStates {}

class StopAudioState extends AudioStates {}

class PauseAudioState extends AudioStates {}

class ErrorAudioState extends AudioStates {
  final String message;

  ErrorAudioState({
    required this.message,
  });
}

abstract class GetAudioStates {}

class GetInitialAudioState extends GetAudioStates {}

class GetLoadingAudioState extends GetAudioStates {}

class GetSuccesAudioState extends GetAudioStates {}

class GetErrorAudioState extends GetAudioStates {
  final String message;

  GetErrorAudioState({
    required this.message,
  });
}
