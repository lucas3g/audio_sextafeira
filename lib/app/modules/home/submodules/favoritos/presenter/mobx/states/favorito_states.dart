abstract class FavoritoStates {}

class InitialFavoritoState extends FavoritoStates {}

class LoadingFavoritoState extends FavoritoStates {}

class SuccessLoadListState extends FavoritoStates {}

class ErrorLoadListState extends FavoritoStates {
  final String message;

  ErrorLoadListState({
    required this.message,
  });
}
