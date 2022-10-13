abstract class AudioStates {}

class InitialAudioState extends AudioStates {}

class PlayAudioState extends AudioStates {}

class FinishAudioState extends AudioStates {}

class StopAudioState extends AudioStates {}

class ErrorAudioState extends AudioStates {
  final String message;

  ErrorAudioState({
    required this.message,
  });
}
