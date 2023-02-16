import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/user.dart';
import '../locale_db.dart';

class AuthOperations {
  DatabaseHelper db = DatabaseHelper();

  Future<int> addItemToDatabase(User user) async {
    Database? mydb = await db.db;
    var raw = await mydb!.insert(
      DatabaseHelper.usersTableName,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  Future<List<User>> getAllItems() async {
    Database? mydb = await db.db;
    var response = await mydb!.query(DatabaseHelper.usersTableName);
    List<User> list = response.map((c) => User.fromJson(c)).toList();
    print('local data base');
    debugPrint(list.toString());
    return list;
  }
}
