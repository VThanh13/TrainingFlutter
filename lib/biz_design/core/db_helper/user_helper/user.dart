import 'package:sqflite/sqflite.dart';

import 'database_connection.dart';

class User {
  late DatabaseConnection _databaseConnection;
  User() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  Future<int?> insertData(String table, Map<String, Object> data) async {
    final connection = await database;

    int? id = await connection?.insert(table, data);
    return id;
  }

  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }
}
