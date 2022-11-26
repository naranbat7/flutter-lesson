import 'package:income/models/income.dart';
import 'package:income/models/index.dart';
import 'package:income/providers/index.dart';
import 'package:income/repos/index.dart';

class IncomeRepo extends StorableData<IncomeModel> {
  IncomeRepo({required super.db, super.tableName = "Income"});

  @override
  Future<int> addOne(StorableModel element) async {
    final val = super.addOne(element);
    DatabaseProvider.instance.fetchIncome();
    return val;
  }

  @override
  String get insertOneQuery => '''
    INSERT INTO $tableName(isIncome, amount, description)
    VALUES(?, ?, ?)
  ''';

  @override
  String get strCreateTable => '''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      isIncome BOOLEAN NOT NULL,
      amount TEXT NOT NULL,
      description TEXT NOT NULL)
  ''';

  @override
  String get updateOneQuery => '''
  UPDATE $tableName SET
    isIncome = ?
    amount = ?
    description = ?
    WHERE id = ?
  ''';
}
