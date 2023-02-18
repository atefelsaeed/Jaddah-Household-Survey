import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/user.dart';
import '../locale_db.dart';

class AuthOperations {
  DatabaseHelper db = DatabaseHelper();

  //Add User to database
  Future<int> addItemToDatabase(User user) async {
    Database? myDB = await db.db;
    var raw = await myDB!.insert(
      DatabaseHelper.usersTableName,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  //Get all users from the database
  Future<List<User>> getAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.usersTableName);
    List<User> list = response.map((c) => User.fromJson(c)).toList();
    debugPrint('local data base');
    debugPrint(list.toString());
    return list;
  }
}
