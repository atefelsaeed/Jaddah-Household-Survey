import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/survey_hhs.dart';
import 'package:jaddah_household_survey/Models/survey.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/Enums/hhs_enums.dart';

class SurveysProvider with ChangeNotifier {
  late Map _authHeader;
  late int _uid;
  List<Survey> _surveys;

  SurveysProvider() : _surveys = [];

  factory SurveysProvider.auth(
    Map authHeader,
    int uid,
    SurveysProvider obj,
  ) {
    obj._authHeader = authHeader;
    obj._uid = uid;
    return obj;
  }

  Future<bool> fetch() async {
    try {
      debugPrint("fetching");
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      if (!prefs.containsKey("surveys")) return false;
      var surveysList = prefs.getStringList("surveys")!;
      _surveys = [];
      for (Map<String, dynamic> s in surveysList.map(json.decode).toList()) {
        switch (EnumToString.fromString(SurveyType.values, s['type'],
            camelCase: true)!) {
          case SurveyType.pt:
            debugPrint('add new');
            _surveys.add(SurveyPT.fromJson(s));
            debugPrint('add new Done');
            break;
          default:
        }
      }
      _surveys = _surveys.where((s) => s.header.empNumber == _uid).toList();
      for (var e in _surveys) {
        debugPrint(e.synced.toString());
      }

      notifyListeners();
      return true;
    } catch (r) {
      debugPrint(r.toString());
      rethrow;
    }
  }

  List<Survey> get surveys {
    // syncAll();
    return List<Survey>.from(_surveys).reversed.toList();
  }

  bool get isEmtpy {
    return _surveys.isEmpty;
  }

  Future<bool> addSurvey(Survey s) async {
    try {
      _surveys.removeWhere((e) => e.id == s.id);
      _surveys.add(s);
      await save();
      notifyListeners();
      return true;
    } catch (er) {
      debugPrint(er.toString());
      rethrow;
    }
  }

  Future<bool> save() async {
    try {
      debugPrint("changing data");
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      debugPrint('prefs reload');
      prefs.setStringList(
        "surveys",
        _surveys.map((v) => json.encode(v.toJson())).toList(),
      );
      debugPrint('save survey');
      return true;
    } catch (er) {
      debugPrint(er.toString());
      rethrow;
    }
  }
}
