abstract class IAudioException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const IAudioException({
    required this.message,
    this.stackTrace,
  });
}

class AudioException extends IAudioException {
  const AudioException({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
