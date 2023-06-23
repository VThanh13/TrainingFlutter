import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  setDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

    var database =
        await openDatabase(dbPath, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        'CREATE TABLE IF NOT EXISTS user (id TEXT, businessComment TEXT, industryConnect TEXT, area TEXT, career TEXT, personSkill TEXT, qualification TEXT, director TEXT, annualIncome TEXT, asset TEXT, placeOfBirth TEXT, hobby TEXT)';
    await database.execute(sql);
  }
}
