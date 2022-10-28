import 'dart:async';

import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/filter_entity.dart';
import 'package:audio_sextafeira/app/core_module/services/sqflite/adapters/table_entity.dart';
import 'package:sqflite/sqflite.dart';

class SqFliteHelpers {
  static FutureOr<void> onCreate(
      Set<TableEntity> tables, Database db, int version) {
    final sqlTables = tables.map(SqFliteHelpers.convertTableToSql);

    db.transaction((txn) async {
      for (final table in sqlTables) {
        txn.execute(table);
      }
    });
  }

  static String convertFilterToSqlWhere(FilterEntity entity) {
    final field = entity.name;
    final comparator = _convertFilterTypeToSql(entity.type);

    return '$field $comparator ?';
  }

  static dynamic convertFilterToSqlWhereArgs(FilterEntity entity) {
    return entity.value;
  }

  static String _convertFilterTypeToSql(FilterType filterType) {
    switch (filterType) {
      case FilterType.equal:
        return '=';
      case FilterType.containing:
        return 'containing';
    }
  }

  static String convertTableToSql(TableEntity entity) {
    final tableName = entity.name;
    final sqlFields = entity.fields.map(_convertFieldToSql).join(', ');

    return 'CREATE TABLE $tableName($sqlFields)';
  }

  static String _convertFieldToSql(TableFieldEntity entity) {
    final fieldName = entity.name;
    final type = _convertFieldTypeToSql(entity.type);

    var response = '$fieldName $type';

    if (entity.pk) response += ' PRIMARY KEY AUTOINCREMENT';
    if (!entity.nullable) response += ' NOT NULL';

    return response;
  }

  static String _convertFieldTypeToSql(FieldType fieldType) {
    switch (fieldType) {
      case FieldType.integer:
        return 'INTEGER';
      case FieldType.string:
        return 'TEXT';
    }
  }
}
