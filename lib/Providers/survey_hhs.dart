import 'package:jaddah_household_survey/Models/Vehicles_SurveyModel/vehicles_model.dart';

import '../Data/Enums/hhs_enums.dart';
import '../Models/HHS_SurvyModels/hhs_models.dart';
import '../Models/HHS_SurvyModels/survey_hhs.dart';
import 'survey.dart';

class SurveyPTProvider extends SurveyProvider {
  @override
  String push_url = "personalData";
  late final SurveyPT _data;

  SurveyPTProvider(data) : super(data) {
    _data = super.data as SurveyPT;
  }

  @override
  String get id => _data.id;

  @override
  set id(String id) {
    _data.id = id;
    // notifyListeners();
  }

  @override
  VehiclesModel get vehiclesData => _data.vehiclesData;

  @override
  set vehiclesData(VehiclesModel vehiclesData) {
    _data.vehiclesData = vehiclesData;
    // notifyListeners();
  }

  @override
  SurveyType get type => _data.type;

  @override
  bool get synced => _data.synced;

  @override
  double get headerLat => _data.header.locationLat;

  @override
  set headerLat(double l) {
    _data.header.locationLat = l;
    // notifyListeners();
  }

  @override
  double get headerLong => _data.header.locationLong;

  @override
  set headerLong(double l) {
    _data.header.locationLong = l;
    // notifyListeners();
  }

  @override
  DateTime get interViewDate => _data.header.interviewDate;

  @override
  set interViewDate(DateTime date) {
    _data.header.interviewDate = date;
    // notifyListeners();
  }

  @override
  int get headerEmpNumber => _data.header.empNumber;

  @override
  set headerEmpNumber(int i) {
    _data.header.empNumber = i;
    // notifyListeners();
  }

  @override
  int get headerInterviewNumber => _data.header.interviewNumber;

  @override
  set headerInterviewNumber(int i) {
    _data.header.interviewNumber = i;
    // notifyListeners();
  }

  @override
  String get headerDistrictName => _data.header.districtName;

  @override
  set headerDistrictName(String i) {
    _data.header.districtName = i;
    // notifyListeners();
  }

  @override
  String get headerZoneNumber => _data.header.districtName;

  @override
  set headerZoneNumber(String i) {
    _data.header.districtName = i;
    // notifyListeners();
  }

  //HHS Address
  @override
  String? get hhsCity => _data.header.householdAddress!.city;

  @override
  set hhsCity(String? i) {
    _data.header.householdAddress!.city = i;
    // notifyListeners();
  }

  @override
  String? get hhsBuildingName => _data.header.householdAddress!.buildingName;

  @override
  set hhsBuildingName(String? i) {
    _data.header.householdAddress!.buildingName = i;
    // notifyListeners();
  }

  @override
  String? get hhsStreetName => _data.header.householdAddress!.streetName;

  @override
  set hhsStreetName(String? i) {
    _data.header.householdAddress!.streetName = i;
    // notifyListeners();
  }

  @override
  String? get hhsStreetNumber => _data.header.householdAddress!.streetNumber;

  @override
  set hhsStreetNumber(String? i) {
    _data.header.householdAddress!.streetNumber = i;
    // notifyListeners();
  }

  @override
  String? get hhsNearestLandMark =>
      _data.header.householdAddress!.nearestLandMark;

  @override
  set hhsNearestLandMark(String? i) {
    _data.header.householdAddress!.nearestLandMark = i;
    // notifyListeners();
  }

  @override
  String? get hhsBlockNearestCrossStreets =>
      _data.header.householdAddress!.nearestLandMark;

  @override
  set hhsBlockNearestCrossStreets(String? i) {
    _data.header.householdAddress!.nearestLandMark = i;
    // notifyListeners();
  }

  @override
  String? get hhsAreaSuburb => _data.header.householdAddress!.nearestLandMark;

  @override
  set hhsAreaSuburb(String? i) {
    _data.header.householdAddress!.nearestLandMark = i;
    // notifyListeners();
  }

  ///==========householdQuestions====================
  @override
  String get hhsDwellingType => _data.householdQuestions.hhsDwellingType;

  @override
  set hhsDwellingType(String i) {
    _data.householdQuestions.hhsDwellingType = i;
    // notifyListeners();
  }

  @override
  String get hhsIsDwellingType => _data.householdQuestions.hhsIsDwelling;

  @override
  set hhsIsDwellingType(String i) {
    _data.householdQuestions.hhsIsDwelling = i;
    // notifyListeners();
  }

  @override
  int get hhsNumberBedRooms => _data.householdQuestions.hhsNumberBedRooms;

  @override
  set hhsNumberBedRooms(int i) {
    _data.householdQuestions.hhsNumberBedRooms = i;
    // notifyListeners();
  }

  @override
  int get hhsNumberSeparateFamilies =>
      _data.householdQuestions.hhsNumberSeparateFamilies;

  @override
  set hhsNumberSeparateFamilies(int i) {
    _data.householdQuestions.hhsNumberSeparateFamilies = i;
    // notifyListeners();
  }

  @override
  int get hhsNumberAdults => _data.householdQuestions.hhsNumberAdults;

  @override
  set hhsNumberAdults(int i) {
    _data.householdQuestions.hhsNumberAdults = i;
    // notifyListeners();
  }

  @override
  int get hhsNumberChildren => _data.householdQuestions.hhsNumberChildren;

  @override
  set hhsNumberChildren(int i) {
    _data.householdQuestions.hhsNumberChildren = i;
    // notifyListeners();
  }

  @override
  String get hhsNumberYearsInAddress =>
      _data.householdQuestions.hhsNumberYearsInAddress;

  @override
  set hhsNumberYearsInAddress(String i) {
    _data.householdQuestions.hhsNumberYearsInAddress = i;
    // notifyListeners();
  }

  @override
  bool get hhsIsDemolishedAreas =>
      _data.householdQuestions.hhsIsDemolishedAreas;

  @override
  set hhsIsDemolishedAreas(bool i) {
    _data.householdQuestions.hhsIsDemolishedAreas = i;
    // notifyListeners();
  }

  @override
  String? get hhsDemolishedAreas => _data.householdQuestions.hhsDemolishedAreas;

  @override
  set hhsDemolishedAreas(String? i) {
    _data.householdQuestions.hhsDemolishedAreas = i;
    // notifyListeners();
  }

  ///==============hhsPedalCycles(PC)====================
  @override
  int? get hhsPCTotalBikesNumber =>
      _data.householdQuestions.hhsPedalCycles!.totalBikesNumber;

  @override
  set hhsPCTotalBikesNumber(int? i) {
    _data.householdQuestions.hhsPedalCycles!.totalBikesNumber = i;
    // notifyListeners();
  }

  @override
  int? get hhsPCAdultsBikesNumber =>
      _data.householdQuestions.hhsPedalCycles!.adultsBikesNumber;

  @override
  set hhsPCAdultsBikesNumber(int? i) {
    _data.householdQuestions.hhsPedalCycles!.adultsBikesNumber = i;
    // notifyListeners();
  }

  @override
  int? get hhsPCChildrenBikesNumber =>
      _data.householdQuestions.hhsPedalCycles!.childrenBikesNumber;

  @override
  set hhsPCChildrenBikesNumber(int? i) {
    _data.householdQuestions.hhsPedalCycles!.childrenBikesNumber = i;
    // notifyListeners();
  }

  ///==============hhsElectricCycles(EC)====================
  @override
  int? get hhsECTotalBikesNumber =>
      _data.householdQuestions.hhsElectricCycles!.totalBikesNumber;

  @override
  set hhsECTotalBikesNumber(int? i) {
    _data.householdQuestions.hhsElectricCycles!.totalBikesNumber = i;
    // notifyListeners();
  }

  @override
  int? get hhsECAdultsBikesNumber =>
      _data.householdQuestions.hhsElectricCycles!.adultsBikesNumber;

  @override
  set hhsECAdultsBikesNumber(int? i) {
    _data.householdQuestions.hhsElectricCycles!.adultsBikesNumber = i;
    // notifyListeners();
  }

  @override
  int? get hhsECChildrenBikesNumber =>
      _data.householdQuestions.hhsElectricCycles!.childrenBikesNumber;

  @override
  set hhsECChildrenBikesNumber(int? i) {
    _data.householdQuestions.hhsElectricCycles!.childrenBikesNumber = i;
    // notifyListeners();
  }

  ///==============hhsElectricScooter(ES)====================
  @override
  int? get hhsESTotalBikesNumber =>
      _data.householdQuestions.hhsElectricScooter!.totalBikesNumber;

  @override
  set hhsESTotalBikesNumber(int? i) {
    _data.householdQuestions.hhsElectricScooter!.totalBikesNumber = i;
    // notifyListeners();
  }

  @override
  int? get hhsESAdultsBikesNumber =>
      _data.householdQuestions.hhsElectricScooter!.adultsBikesNumber;

  @override
  set hhsESAdultsBikesNumber(int? i) {
    _data.householdQuestions.hhsElectricScooter!.adultsBikesNumber = i;
    // notifyListeners();
  }

  @override
  int? get hhsESChildrenBikesNumber =>
      _data.householdQuestions.hhsElectricScooter!.childrenBikesNumber;

  @override
  set hhsESChildrenBikesNumber(int? i) {
    _data.householdQuestions.hhsElectricScooter!.childrenBikesNumber = i;
    // notifyListeners();
  }

  @override
  String? get hhsTotalIncome => _data.householdQuestions.hhsTotalIncome;

  @override
  set hhsTotalIncome(String ?i) {
    _data.householdQuestions.hhsTotalIncome = i;
    // notifyListeners();
  }

  @override
  set hhsSeparateFamilies(List<SeparateFamilies> e) =>
      _data.hhsSeparateFamilies = e;

  @override
  List<SeparateFamilies> get hhsSeparateFamilies =>
      [...?_data.hhsSeparateFamilies];
}