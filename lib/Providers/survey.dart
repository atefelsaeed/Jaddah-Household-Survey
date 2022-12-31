import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/api_helper.dart';
import '../Models/survey.dart';

abstract class SurveyProvider with ChangeNotifier {
  late Map _authHeader;
  final Survey data;
  bool syncing = false;

  SurveyProvider(this.data);

  abstract String push_url;

  void auth(
    Map authHeader,
  ) {
    _authHeader = authHeader;
  }

  // Future<bool> fetch() async {
  //   // var response = await APIHelper.getData(
  //   //   url: "events/${_data.id}",
  //   //   body: _authHeader,
  //   // );
  //   // print('fetching');
  //   // if (response.statusCode == 200) {
  //   //   var data = json.decode(response.body);
  //   //   _members = (data['data']['familyMembers'] as List)
  //   //       .map((e) => MemberInfo.fromJson(e))
  //   //       .toList();
  //   //   _members.insert(0, MemberInfo(id: -1, name: "Me", image: ''));
  //   //   notifyListeners();
  //   //   return true;
  //   // } else {
  //   //   throw Future.error('Couldn\'t fetch data');
  //   // }
  //   notifyListeners();
  //   return true;
  // }

  Future<bool> sync({callback, bool force = false}) async {
    // print('trying to ${data.header.date}');
    final prefs = await SharedPreferences.getInstance();
    while (prefs.getBool('dontsync')! && !force) {
      await Future.delayed(Duration(seconds: 1));
      print("dont sync effect");
    }
    if (synced || syncing) {
      print('already trying to  $synced $syncing');
      return true;
    }
    syncing = true;
    notifyListeners();
    print('data send to server ...');
    log(json.encode(data));
    final res;
    try {
      print('push_url.= ' + push_url);
      res = await APIHelper.postData(
        url: push_url,
        body: json.encode(data.toJson()),
      );
      print(res);
    } catch (e) {
      syncing = false;
      // await Future.delayed(Duration(seconds: 1));
      notifyListeners();
      return Future.error("couldn't reach server");
    }
    print(res.body);
    if (res.statusCode != 200) {
      syncing = false;
      notifyListeners();
      print("server refused");
      return Future.error("server refused");
    }
    // print('${data.header.date} sent request');
    //
    final resObj = json.decode(res.body);
    data.synced = resObj['status'];
    syncing = false;
    if (callback != null) {
      callback();
    }
    print('synced');
    notifyListeners();
    return true;
  }

  String get id;

  set id(String id);

  bool get synced;

  // set synced(bool s);

  double get headerLat;

  set headerLat(double l);

  double get headerLong;

  set headerLong(double l);

  DateTime get interViewDate;

  set interViewDate(DateTime date);

  int get headerEmpNumber;

  set headerEmpNumber(int l);

  int get headerInterviewNumber;

  set headerInterviewNumber(int l);

  String get headerDistrictName;

  set headerDistrictName(String l);

  String get headerZoneNumber;

  set headerZoneNumber(String l);

//==========HHS Address============
  String? get hhsCity;

  set hhsCity(String? l);

  String? get hhsBuildingName;

  set hhsBuildingName(String? l);

  String? get hhsStreetName;

  set hhsStreetName(String? l);

  String? get hhsStreetNumber;

  set hhsStreetNumber(String? l);

  String? get hhsNearestLandMark;

  set hhsNearestLandMark(String? l);

  String? get hhsBlockNearestCrossStreets;

  set hhsBlockNearestCrossStreets(String? l);

  String? get hhsAreaSuburb;

  set hhsAreaSuburb(String? l);
}
