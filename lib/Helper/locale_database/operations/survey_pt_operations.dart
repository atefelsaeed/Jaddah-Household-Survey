import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/HHS_SurvyModels/survey_hhs.dart';
import '../../../Models/survey.dart';
import '../locale_db.dart';

class SurveyPtOperations {
  DatabaseHelper db = DatabaseHelper();

  //Add survey PT Table to database
  Future<int> addItemToSurveyPtDatabase(Survey survey) async {
    Database? myDB = await db.db;
    var raw = await myDB!.insert(
      DatabaseHelper.surveyPTTableName,
      survey.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  //Get all survey PT Table from the database
  Future<List<SurveyPT>> getSurveyPtAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableName);
    List<SurveyPT>? list =List.from(response).map((e)=>SurveyPT.fromJson(e)).toList();
    debugPrint('local data base');
    debugPrint(list.toString());
    return list;
  }

  //Add survey PT Table Offline to database
  Future<int> addItemToSurveyPtOfflineDatabase(
      Survey survey) async {
    Database? myDB = await db.db;
    var raw = await myDB!.insert(
      DatabaseHelper.surveyPTTableOfflineName,
      survey.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  //Get all survey PT Table Offline from the database
  Future<List<SurveyPT>> getSurveyPtOfflineAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableOfflineName);
    List<SurveyPT>? list =List.from(response).map((e)=>SurveyPT.fromJson(e)).toList();
    debugPrint('local data base');
    debugPrint(list.toString());
    return list;
  }
}
