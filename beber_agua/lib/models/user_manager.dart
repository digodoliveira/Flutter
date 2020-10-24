import 'dart:async';

import 'package:beber_agua/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String userTable = 'user';
final String idColumn = 'id';
final String nameColumn = 'name';
final String birthdateColumn = 'birthdate';
final String genreColumn = 'genre';
final String heightColumn = 'height';
final String weightColumn = 'weight';
final String goalColumn = 'goal';

class UserManager {
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();

      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "drinkwater.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          'CREATE TABLE $userTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $birthdateColumn NUMERIC, $genreColumn TEXT, $heightColumn REAL, $weightColumn REAL, $goalColumn REAL)');
    });
  }

  Future<User> getUser(int id) async {
    Database dbUser = await db;

    List<Map> maps = await dbUser.query(
      userTable,
      columns: [
        idColumn,
        nameColumn,
        birthdateColumn,
        genreColumn,
        heightColumn,
        weightColumn,
        goalColumn
      ],
      where: '$idColumn = ?',
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<User> save(User user) async {
    loading = true;

    Database dbUser = await db;
    user.id = await dbUser.insert(userTable, user.toMap());

    loading = false;

    return user;
  }

  Future<int> update(User user) async {
    Database dbUser = await db;
    return await dbUser.update(
      userTable,
      user.toMap(),
      where: '$idColumn = ? ',
      whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    Database dbUser = await db;
    return await dbUser.delete(
      userTable,
      where: '$idColumn=?',
      whereArgs: [id],
    );
  }
}
