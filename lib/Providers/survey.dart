import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jaddah_household_survey/Data/Enums/hhs_enums.dart';
import 'package:jaddah_household_survey/Models/Vehicles_SurveyModel/vehicles_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/api_helper.dart';
import '../Models/HHS_SurvyModels/hhs_models.dart';
import '../Models/Person_SurveyModel/person_model.dart';
import '../Models/Trips_SurveyModel/trips_model.dart';
import '../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
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

  Future<bool> sync({callback, bool force = false}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    var surveysList = prefs.getStringList("surveys")!;

    while (prefs.getBool('dontsync')!&& !force) {
      await Future.delayed(const Duration(seconds: 1));
      debugPrint("dont sync effect");
    }

    if (synced || syncing) {
      debugPrint('already trying to  $synced $syncing');
      return true;
    }

    syncing = true;
    notifyListeners();

    final Response res;
    try {

      res = await APIHelper.postData(
        url: push_url,
        body: json.encode(data.toJson()),
      );

    } catch (e) {
      syncing = false;
      // await Future.delayed(Duration(seconds: 1));
      notifyListeners();
      return Future.error("couldn't reach server");
    }
    if (res.statusCode != 200) {
      syncing = false;
      notifyListeners();
      debugPrint("server refused");
      return Future.error("server refused");
    }
    // debugPrint('${data.header.date} sent request');
    //
    final resObj = json.decode(res.body);
    data.synced = resObj['status'];
    syncing = false;
    if (callback != null) {
      callback();
    }
    debugPrint('synced');
    notifyListeners();
    return true;
  }

  // Future<bool> multiSync({callback, bool force = false}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.reload();
  //   var surveysList = prefs.getStringList("surveys")!;
  //   while (prefs.getBool('dontsync')!&& !force) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     debugPrint("dont sync effect");
  //   }
  //
  //   final Response res;
  //   try {
  //     log("Body Data", error: json.encode(surveysList));
  //     res = await APIHelper.postData(
  //       url: "multi",
  //       body: json.encode(surveysList),
  //     );
  //
  //     log("res",error: res.body);
  //   } catch (e) {
  //     return Future.error("couldn't reach server");
  //   }
  //   debugPrint(res.body);
  //   if (res.statusCode != 200) {
  //     syncing = false;
  //     notifyListeners();
  //     debugPrint("server refused");
  //     return Future.error("server refused");
  //   }
  //   // final resObj = json.decode(res.body);
  //   // data.synced = resObj['status'];
  //   if (callback != null) {
  //     callback();
  //   }
  //   notifyListeners();
  //   return true;
  // }

  String get id;

  set id(String id);

  SurveyType get type;

  VehiclesModel get vehiclesData;

  set vehiclesData(VehiclesModel id);

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

  int? get headerInterviewNumber;

  set headerInterviewNumber(int? l);

  String? get headerDistrictName;

  set headerDistrictName(String? l);

  String get headerZoneNumber;

  set headerZoneNumber(String l);

//==========HHS Address============

  String? get hhsAddressLat;

  set hhsAddressLat(String? l);

  String? get hhsAddressLong;

  set hhsAddressLong(String? l);

  TextEditingController get hhsPhone;

  ///=========HouseholdQuestions=================
  String? get hhsDwellingType;

  set hhsDwellingType(String? l);

  String? get hhsIsDwellingType;

  set hhsIsDwellingType(String? l);

  TextEditingController get hhsNumberBedRooms;

  set hhsNumberBedRooms(TextEditingController l);

  TextEditingController get hhsNumberApartments;

  set hhsNumberApartments(TextEditingController l);

  TextEditingController get hhsNumberFloors;

  set hhsNumberFloors(TextEditingController l);

  String? get hhsNumberSeparateFamilies;

  set hhsNumberSeparateFamilies(String? l);

  String? get hhsNumberAdults;

  set hhsNumberAdults(String? l);

  String? get hhsNumberChildren;

  set hhsNumberChildren(String? l);

  String? get hhsNumberYearsInAddress;

  set hhsNumberYearsInAddress(String? l);

  bool? get hhsIsDemolishedAreas;

  set hhsIsDemolishedAreas(bool? l);

  String? get hhsDemolishedAreas;

  set hhsDemolishedAreas(String? l);

  ///==============hhsPedalCycles(PC)====================
  String get hhsPCTotalBikesNumber;

  set hhsPCTotalBikesNumber(String l);

  String get hhsPCAdultsBikesNumber;

  set hhsPCAdultsBikesNumber(String l);

  String get hhsPCChildrenBikesNumber;

  set hhsPCChildrenBikesNumber(String l);

  ///==============hhsElectricCycles(EC)====================
  String get hhsECTotalBikesNumber;

  set hhsECTotalBikesNumber(String l);

  String get hhsECAdultsBikesNumber;

  set hhsECAdultsBikesNumber(String l);

  String get hhsECChildrenBikesNumber;

  set hhsECChildrenBikesNumber(String l);

  ///==============hhsElectricScooter(ES)====================
  String get hhsESTotalBikesNumber;

  set hhsESTotalBikesNumber(String l);

  String get hhsESAdultsBikesNumber;

  set hhsESAdultsBikesNumber(String l);

  String get hhsESChildrenBikesNumber;

  set hhsESChildrenBikesNumber(String l);

  String? get hhsTotalIncome;

  set hhsTotalIncome(String? l);

  set hhsSeparateFamilies(List<SeparateFamilies> e);

  List<SeparateFamilies> get hhsSeparateFamilies;

  set vehiclesBodyType(List<VehiclesBodyType> e);

  List<VehiclesBodyType> get vehiclesBodyType;

  set personData(List<PersonModel> e);

  List<PersonModel> get personData;

  set tripsList(List<TripsModel> e);

  List<TripsModel> get tripsList;
}
