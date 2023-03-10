import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Models/HHS_SurvyModels/survey_hhs.dart';
import '../../../Models/survey.dart';
import '../locale_db.dart';

class SurveyPtOperations {
  DatabaseHelper db = DatabaseHelper();

  //Add survey PT Table to database
  Future<int?> addItemToSurveyPtDatabase(Survey survey) async {
    Database? myDB = await db.db;
    List<SurveyPT> list = await getSurveyPtAllItems();

    int? raw;
    if (list.isEmpty) {
      raw = await myDB!.insert(
        DatabaseHelper.surveyPTTableName,
        survey.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      raw = await update(survey);
    }

    debugPrint('Add Item To Survey PT Database');
    return raw;
  }

  //Update Survey PT Items
  Future<int> update(Survey survey) async {
    Database? myDB = await db.db;
    debugPrint('Update Item');
    return await myDB!.update(
      DatabaseHelper.surveyPTTableName,
      survey.toJson(),
      where: 'id = ?',
      whereArgs: [survey.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Get all survey PT Table from the database
  Future<List<SurveyPT>> getSurveyPtAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableName);
    List<SurveyPT>? list =
        List.from(response).map((e) => SurveyPT.fromJson(e)).toList();

    debugPrint('Get Survey PT DB');
    debugPrint(list.toString());
    debugPrint(list.length.toString());
    return list;
  }

  //Delete deleteSurveyPTTable
  Future<int> deleteSurveyPTTable() async {
    Database? myDB = await db.db;
    var raw = await myDB!.delete(DatabaseHelper.surveyPTTableName);
    debugPrint('Delete Survey PT Table');
    return raw;
  }

  //Add survey PT Table Offline to database
  Future<int> addItemToSurveyPtOfflineDatabase(Survey survey) async {
    Database? myDB = await db.db;
    debugPrint('Add Offline Survey PT to local database');
    var raw = await myDB!.insert(
      DatabaseHelper.surveyPTTableOfflineName,
      survey.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  //Delete deleteSurveyPTTableOffline
  Future<int> deleteSurveyPTTableOffline() async {
    Database? myDB = await db.db;
    var raw = await myDB!.delete(DatabaseHelper.surveyPTTableOfflineName);
    debugPrint('Delete Survey PT Table Offline');
    return raw;
  }

  //Get all survey PT Table Offline from the database
  Future<List<Survey>> getSurveyPtOfflineAllItems() async {
    Database? myDB = await db.db;
    var response = await myDB!.query(DatabaseHelper.surveyPTTableOfflineName);
    List<Survey>? list =
        List.from(response).map((e) => SurveyPT.fromJson(e)).toList();
    debugPrint('Get Offline Survey PT to local database');
    return list;
  }
}
