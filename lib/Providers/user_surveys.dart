import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/api_helper.dart';
import '../Helper/api_routing.dart';
import '../Models/survey.dart';
import '../Models/user_serveys_model.dart';
import '../Models/user_surves_status.dart';

class UserSurveysProvider with ChangeNotifier {
  List<Map<String, dynamic>> list = [];
  List<String> list2 = [''];
  final List<Survey> _surveys = [];

  Future<bool> save() async {
    try {
      print("changing data");
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      print('prefs reload');
      prefs.setStringList(
        "surveys",
        _surveys.map((v) => json.encode(v.toJson())).toList(),
      );
      print('save survey');
      return true;
    } catch (er) {
      print(er.toString());
      rethrow;
    }
  }

  bool iSSyncing = false;

  Future<bool> multiSync({callback, bool force = false}) async {
    iSSyncing = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    final surveysList = prefs.getStringList("surveys")!;
    for (var element in surveysList) {
      list.add(json.decode(element));
    }
    // while (prefs.getBool('dontsync')! && !force) {
    //   await Future.delayed(const Duration(seconds: 1));
    //   print("dont sync effect");
    // }

    final Response res;
    try {
      log("Body Data", error: json.encode(list));
      res = await APIHelper.postData(
        url: "multi",
        body: json.encode(list),
      );
      iSSyncing = false;
      notifyListeners();
      log("res", error: res.body);
    } catch (e) {
      iSSyncing = false;
      notifyListeners();
      return Future.error("couldn't reach server");
    }
    if (res.statusCode != 200) {
      notifyListeners();
      print("server refused");
      iSSyncing = false;
      notifyListeners();
      return Future.error("server refused");
    }
    // final resObj = json.decode(res.body);
    // data.synced = resObj['status'];
    if (callback != null) {
      callback();
    }
    iSSyncing = false;
    notifyListeners();
    return true;
  }

  List<UserSurveysModelData> _userSurveysSurveysList = [];
  UserSurveyStatusData? _userSurveyStatusData;

  UserSurveyStatusData? get userSurveyStatusData {
    return _userSurveyStatusData;
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
  int index = 0;

//============Fetch-All-User-Surveys-on-Search-Screen===============
  Future<bool> fetch(int id) async {
    try {
      loading = true;
      var response = await APIHelper.getData(
        url: "${APIRouting.getSurveis}$id",
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
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

//==========Fetch-User-Survey-Status-on-Home-Screen=============
  Future<bool> fetchUserSurveysStatus(int id) async {
    try {
      loading = true;
      var response = await APIHelper.getData(
        url: "${APIRouting.userSurveysStatus}$id",
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // if (!data['status']) return false;
        _userSurveyStatusData = UserSurveyStatusData.fromJson(data['data']);
        print("fffff");
        print(_userSurveyStatusData?.allForms.toString());
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
          "userSurveysStatus",
          json.encode(_userSurveyStatusData),
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
      if (!prefs.containsKey("userSurveysStatus")) return false;

      _userSurveyStatusData = UserSurveyStatusData.fromJson(
          json.decode(prefs.getString("userSurveysStatus")!));
      print("fffsssff");
      print(_userSurveyStatusData?.allForms.toString());
      loading = false;
      notifyListeners();
      return true;
    }
  }
}
