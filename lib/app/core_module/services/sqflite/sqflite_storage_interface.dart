import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/sqflite_adapter.dart';

abstract class ISQLFliteStorage {
  Future<void> init(SQLFliteInitParam param);
  Future<void> create(SQLFliteInsertParam params);
  Future<List<Map<String, dynamic>>> getPerFilter(
      SQLFliteGetPerFilterParam param);
  Future<List<Map<String, dynamic>>> getAll(SQLFliteGetAllParam param);
  Future<void> delete(SQLFliteDeleteParam param);
}
