import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/user_serveys_model.dart';
import '../locale_db.dart';

class HHSUserSurveysOperations {
  DatabaseHelper db = DatabaseHelper();

  //Add UserSurveys to database
  Future<int> addItemToDatabase(
      UserSurveysModelData userSurveysModelData) async {
    Database? myDB = await db.db;
    var raw = await myDB!.insert(
      DatabaseHelper.usersTableName,
      userSurveysModelData.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  //Get all UserSurveys from the database
  Future<List<UserSurveysModelData>> getAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.usersTableName);
    List<UserSurveysModelData> list =
        response.map((c) => UserSurveysModelData.fromJson(c)).toList();
    debugPrint('local data base');
    debugPrint(list.toString());
    return list;
  }
}
