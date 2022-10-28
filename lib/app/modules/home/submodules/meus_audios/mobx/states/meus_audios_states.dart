abstract class MeusAudiosStates {}

class InitialMeusAudiosStates extends MeusAudiosStates {}

class LoadingMeusAudiosStates extends MeusAudiosStates {}

class SuccessMeusAudiosStates extends MeusAudiosStates {}

class ErrorMeusAudiosStates extends MeusAudiosStates {
  final String message;

  ErrorMeusAudiosStates({
    required this.message,
  });
}
