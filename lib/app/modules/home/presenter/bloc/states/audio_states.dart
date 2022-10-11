abstract class AudioStates {}

class InitialAudioState extends AudioStates {}

class LoadingAudioState extends AudioStates {}

class PlayAudioState extends AudioStates {}

class StopAudioState extends AudioStates {}

class ErrorAudioState extends AudioStates {
  final String message;

  ErrorAudioState({
    required this.message,
  });
}
