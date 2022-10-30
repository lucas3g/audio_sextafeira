import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/filter_entity.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/table_entity.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/tables.dart';

class SQLFliteInsertParam {
  final Tables table;
  final Map<String, dynamic> data;

  SQLFliteInsertParam({
    required this.table,
    required this.data,
  });
}

class SQLFliteInitParam {
  final String fileName;
  final Set<TableEntity> tables;

  SQLFliteInitParam({
    required this.fileName,
    required this.tables,
  });
}

class SQLFliteDeleteParam {
  final Tables table;
  final int id;

  SQLFliteDeleteParam({
    required this.table,
    required this.id,
  });
}

class SQLFliteUpdateParam {
  final Tables table;
  final int id;
  final String field;
  final dynamic value;

  SQLFliteUpdateParam({
    required this.table,
    required this.id,
    required this.field,
    required this.value,
  });
}

class SQLFliteGetAllParam {
  final Tables table;

  SQLFliteGetAllParam({
    required this.table,
  });
}

class SQLFliteGetPerFilterParam {
  final Tables table;
  final Set<FilterEntity>? filters;

  SQLFliteGetPerFilterParam({
    required this.table,
    this.filters,
  });
}
