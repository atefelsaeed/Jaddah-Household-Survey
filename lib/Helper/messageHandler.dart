import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/survey_hhs.dart';
import 'package:jaddah_household_survey/Models/survey.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/Enums/hhs_enums.dart';

Future<void> messageHandler(RemoteMessage message) async {
  print('will sync');
  syncall();
}

Future<bool> syncall() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.reload();
  prefs.setBool('dontsync', true);
  if (!prefs.containsKey("surveys")) return false;
  var surveysList = prefs.getStringList("surveys")!;
  final _surveys = [];
  for (Map<String, dynamic> s in surveysList.map(json.decode).toList()) {
    switch (EnumToString.fromString(SurveyType.values, s['type'],
        camelCase: true)!) {
      case SurveyType.pt:
        _surveys.add(SurveyPT.fromJson(s));
        break;
      default:
    }
  }
  for (var e in _surveys) {
    print(e.synced);
  }

  for (Survey i in _surveys) {
    print(i.header.interviewDate);
    await i.provider.sync(force: true);
  }
  for (var e in _surveys) {
    print(e.synced);
  }

  prefs
      .setStringList(
        "surveys",
        _surveys.map((v) => json.encode(v.toJson())).toList(),
      )
      .then((value) => print("done"))
      .onError(
    (error, stackTrace) {
      print(error.toString());
      return false;
    },
  );
  prefs.setBool('dontsync', false);
  print(_surveys.map((v) => json.encode(v.toJson())).toList());
  return true;
}
