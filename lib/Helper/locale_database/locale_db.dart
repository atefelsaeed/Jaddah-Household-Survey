import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Helper/locale_database/locale_db_querys.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../Models/user.dart';

class DatabaseHelper {
  static Database? _db;
  static String databaseName = 'JaddahSurvey.db';
  static String surveyPTTableName = 'servey_p_t_s';
  static String usersTableName = 'users';
  static String surveysTableName = 'survies';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializedDB();
      return _db;
    } else {
      return _db;
    }
  }
  addItemToDatabase(User user) async {
    Database? mydb = await db;
    var raw = await mydb!.insert(
      usersTableName,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }
  Future<List<User>> getAllItems() async {
    Database? mydb = await db;
    var response = await mydb!.query(usersTableName);
    List<User> list =
    response.map((c) => User.fromJson(c)).toList();
    print('local data base');
    debugPrint(list.toString());
    return list;
  }

  Future<Database> initializedDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, databaseName);
    Database myDB = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDB;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future<void> _onCreate(Database db, int version) async {
    // await db.execute(LocaleDBQueries.createSurveyPTTable);
    // await db.execute(LocaleDBQueries.crateSurveysTable);
    await db.execute(LocaleDBQueries.crateUsersTable);
    log('CREATE DATABASE AND TABLE ====================================>');
  }

  Future<List<Map>> readData(String sql) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }

  myDeleteDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'JaddahSurvey.db');
    await deleteDatabase(path);
  }

  deleteAllPersons() async {
    Database? mydb = await db;
    var response = await mydb!.delete("items");
    return response;
  }
}
