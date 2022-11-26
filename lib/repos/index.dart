import 'package:income/models/index.dart';
import 'package:sqflite/sqflite.dart';

abstract class StorableData<T> {
  final Database db;
  final String tableName;

  StorableData({required this.db, required this.tableName});

  Future<void> createTable() async {
    await db.execute(strCreateTable);
  }

  Future<int> addOne(StorableModel element) async {
    int result = await db.rawInsert(insertOneQuery, element.queryList);
    print("Raw insert table: $tableName, result: $result");
    return result;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await db.rawQuery(selectAllQuery);
  }

  String get deleteQuery => "DELETE FROM $tableName WHERE id = ?";
  String get selectAllQuery => "SELECT * FROM $tableName";
  String get selectOneQuery => "SELECT * FROM $tableName WHERE id = ?";

  String get strCreateTable;
  String get insertOneQuery;
  String get updateOneQuery;
}
