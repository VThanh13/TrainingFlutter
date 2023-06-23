import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  setDatabase() async {
    // var directory = await getApplicationDocumentsDirectory();
    // var path = join(directory.path, 'db_crud');
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

    var database =
        await openDatabase(dbPath, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        'CREATE TABLE IF NOT EXISTS notificationDEMO (id TEXT, time TEXT, userAvatar TEXT, userName TEXT, title TEXT, image TEXT, content TEXT)';
    await database.execute(sql);
  }

  Future<bool> isTableExists(String tableName) async {
    final db = await setDatabase();
    var res = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'");
    return res.isNotEmpty;
  }
}
