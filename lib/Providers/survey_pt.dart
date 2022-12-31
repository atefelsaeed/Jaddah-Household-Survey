import '../Data/Enums/hhs_enums.dart';
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
  SurveyType get type => _data.type;

  @override
  bool get synced => _data.synced;

  // @override
  // set synced(bool s) {
  //   _data.synced = s;
  //   // notifyListeners();
  // }

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

// @override
// set journeyExamples(List<JourneyExample> e) => _data.examples = e;
// @override
// List<JourneyExample> get journeyExamples => [..._data.examples];

}
