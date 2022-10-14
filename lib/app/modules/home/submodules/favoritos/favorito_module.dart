import 'package:audio_sextafeira/app/modules/home/submodules/favoritos/presenter/favorito_page.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/favoritos/presenter/mobx/favorito_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritoModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => FavoritoPage(
            favoritoStore: Modular.get<FavoritoStore>(),
          )),
    ),
  ];
}
