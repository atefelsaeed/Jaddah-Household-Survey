import 'package:sqflite/sqflite.dart';

import '../../../Models/user.dart';
import '../locale_db.dart';

class AuthOperations{
  DatabaseHelper db = DatabaseHelper();
  addItemToDatabase(User user) async {
    Database? mydb = await db.db;
    var raw = await mydb!.insert(
      "items",
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }
}