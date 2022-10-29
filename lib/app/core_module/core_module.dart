import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/table_entity.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/sqflite_service.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/sqflite_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/shared_preferences/local_storage_interface.dart';
import 'services/shared_preferences/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/client_http/client_http_interface.dart';
import 'services/client_http/dio_client_http.dart';

Bind<Dio> _dioFactory() {
  final baseOptions = BaseOptions(
    // baseUrl: baseUrl,
    headers: {'Content-Type': 'application/json'},
  );
  return Bind.factory<Dio>((i) => Dio(baseOptions), export: true);
}

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    _dioFactory(),
    Bind.factory<IClientHttp>(
      (i) => DioClientHttp(i()),
      export: true,
    ),
    AsyncBind<SharedPreferences>(
      (i) => SharedPreferences.getInstance(),
      export: true,
    ),
    Bind<ILocalStorage>(
      ((i) => SharedPreferencesService(sharedPreferences: i())),
      export: true,
    ),
    AsyncBind<ISQLFliteStorage>(
      (i) async {
        final service = SQLFliteService();

        final meusAudiosfields = {
          const TableFieldEntity(name: 'id', type: FieldType.integer, pk: true),
          const TableFieldEntity(name: 'title', type: FieldType.string),
          const TableFieldEntity(name: 'path_file', type: FieldType.string),
          const TableFieldEntity(name: 'button_color', type: FieldType.string),
          const TableFieldEntity(name: 'assets', type: FieldType.integer),
          const TableFieldEntity(name: 'favorito', type: FieldType.integer),
        };

        final meusAudios =
            TableEntity(name: 'meus_audios', fields: meusAudiosfields);

        final param = SQLFliteInitParam(
          fileName: 'audios.db',
          tables: {meusAudios},
        );

        await service.init(param);

        return service;
      },
      export: true,
    ),
  ];
}
