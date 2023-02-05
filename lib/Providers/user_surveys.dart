import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/api_helper.dart';
import '../Models/user_serveys_model.dart';

class UserSurveysProvider with ChangeNotifier {
  List<UserSurveysModelData> _userSurveysSurveysList = [];
  UserSurveysModel? _userSurveys;

  UserSurveysModel? get userSurvey {
    return _userSurveys;
  }

  int? _totalUserSurveys;
  int? _totalFinishedUserSurveys;

  int? get totalUserSurveys {
    _totalUserSurveys;
    return null;
  }

  List<UserSurveysModelData> get userSurveys {
    return List<UserSurveysModelData>.from(_userSurveysSurveysList)
        .reversed
        .toList();
  }

  bool isSearching = false;
  List<UserSurveysModelData> searchList = [];
  List<UserSurveysModelData> hayList = [];
  List<UserSurveysModelData> qtaList = [];

  void searchHAY(String value) {
    hayList.clear();
    qtaList.clear();
    searchList.clear();
    for (var element in _userSurveysSurveysList) {
      if (element.haeno
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        hayList.add(element);
      }
    }
    print('searchHAY');
    print(hayList.length);
    notifyListeners();
  }

  void searchQTA(String value) {
    qtaList.clear();
    searchList.clear();
    for (var element in hayList) {
      if (element.qta
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        qtaList.add(element);
      }
    }
    print('searchQTA');
    print(qtaList.length);

    notifyListeners();
  }

  void searchBLOK(String value) {
    searchList.clear();
    for (var element in qtaList) {
      if (element.blok
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        searchList.add(element);
      }
    }
    print('searchBLOK');
    print(searchList.length);
    notifyListeners();
  }

  void changeIcon() {
    isSearching = !isSearching;
    notifyListeners();
  }

  bool loading = false;

  Future<bool> fetch(int id) async {
    try {
      loading = true;
      var response = await APIHelper.getData(
        url: "getSurveis/$id",
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        if (!data['status']) return false;
        _userSurveysSurveysList = (data['data'] as List)
            .map((e) => UserSurveysModelData.fromJson(e))
            .toList();

        final prefs = await SharedPreferences.getInstance();
        prefs.setStringList(
          "userSurveys",
          _userSurveysSurveysList.map((e) => json.encode(e.toJson())).toList(),
        );
        loading = false;
        notifyListeners();
        return true;
      }
      loading = false;
      notifyListeners();
      return false;
    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey("userSurveys")) return false;
      _userSurveysSurveysList = prefs
          .getStringList("userSurveys")!
          .map((e) => UserSurveysModelData.fromJson(json.decode(e)))
          .toList();
      loading = false;
      notifyListeners();
      return true;
    }
  }
}
