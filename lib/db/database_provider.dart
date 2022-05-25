import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:zero_balance/model/expense.dart';

class DatabaseProvider {
  static const int _version = 1;

  static const String _dbName = "Expense.db";

  static Future<Database> _getdatabase() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async =>
        await db.execute(
            "CREATE TABLE Expense(id INTEGER PRIMARY KEY, merchant TEXT NOT NULL, amount TEXT NOT NULL,"
                " expenseCategoryType TEXT NOT NULL, paymentType TEXT NOT NULL, date DATE);"),
        version: _version
    );
  }

  static Future<int> addDatabase(Expense expense) async {
    final db = await _getdatabase();
    return await db.insert("Expense", expense.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Expense>?> getAllExpense() async {
    final db = await _getdatabase();
    final List<Map<String, dynamic>> maps = await db.query("Expense");

    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => Expense.fromJson(maps[index]));
  }

  static Future getAllCategoryExpenseByMerchant(expenseCategoryType) async {
    final db = await _getdatabase();
    final res = await db.rawQuery("select merchant, sum(amount) as Total from Expense "
        "WHERE expenseCategoryType = ? GROUP BY merchant", ['$expenseCategoryType']
    );
    return res;
  }

  static Future getAllExpenseByCategory() async {
    final db = await _getdatabase();
    final res = await db.rawQuery("select expenseCategoryType, sum(amount) as Total from Expense "
        "GROUP BY expenseCategoryType"
    );
    return res;
  }

  static Future getAllCategoryExpense(expenseCategoryType) async {
    final db = await _getdatabase();
    final res = await db.rawQuery("select * from Expense "
        "WHERE expenseCategoryType = ?  ORDER BY date ", ['$expenseCategoryType']
    );
    return res;
  }

  static Future getFoodTotal() async {
    var db = await _getdatabase();
    final res = await db.rawQuery("select sum(amount) as Total from Expense "
        "WHERE expenseCategoryType = ?", ['Food']

    );
    return res;
  }

  static Future getEntertainmentTotal() async {
    var db = await _getdatabase();
    final res = await db.rawQuery("select sum(amount) as Total from Expense "
        "WHERE expenseCategoryType = ?", ['Entertainment']);
    return res;
  }

  static Future getShoppingTotal() async {
    var db = await _getdatabase();
    final res = await db.rawQuery("select sum(amount) as Total from Expense "
        "WHERE expenseCategoryType = ?", ['Shopping']);
    return res;
  }

  static Future getTotal() async {
    var db = await _getdatabase();
    final res = await db.rawQuery("select sum(amount) as Total from Expense ");
    return res;
  }
}