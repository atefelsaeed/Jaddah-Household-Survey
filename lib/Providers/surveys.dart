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
    print("fetching");
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();

    if (!prefs.containsKey("surveys")) return false;
    var surveysList = prefs.getStringList("surveys")!;
    print(surveysList);
    _surveys = [];
    for (Map<String, dynamic> s in surveysList.map(json.decode).toList()) {
      switch (EnumToString.fromString(SurveyType.values, s['type'],
          camelCase: true)!) {
        case SurveyType.pt:
          _surveys.add(SurveyPT.fromJson(s));
          break;
        // case SurveyType.cars:
        //   _surveys.add(SurveyCars.fromJson(s));
        //   break;
        // case SurveyType.freight:
        //   _surveys.add(SurveyFreight.fromJson(s));
        //   break;
        default:
      }
    }
    // _surveys = _surveys.where((s) => s.header.empNumber == _uid).toList();
    _surveys.forEach((e) => print(e.synced));

    notifyListeners();
    return true;
  }

  List<Survey> get surveys {
    // syncAll();
    return List<Survey>.from(_surveys).reversed.toList();
  }

  bool get isEmtpy {
    return _surveys.isEmpty;
  }

  Future<bool> syncAll() async {
    for (var element in _surveys) {
      element.provider.sync(callback: save);
    }
    return true;
  }

  Future<bool> addSurvey(Survey s) async {
    _surveys.add(s);
    notifyListeners();
    save();
    // // await s.provider.sync();
    // notifyListeners();
    return true;
  }

  Future<bool> save() async {
    print("changing data");
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    prefs.setStringList(
      "surveys",
      _surveys.map((v) => json.encode(v.toJson())).toList(),
    );
    return true;
  }
}
