import '/providers/survey.dart';

class HeaderBase {
  late double locationLat;
  late double locationLong;
  late DateTime interviewDate;
  late int interviewNumber;
  late String districtName;
  late String zoneNumber;
  late int empNumber;
  HouseholdAddress? householdAddress;

  HeaderBase();
}

class HouseholdAddress {
  String? buildingName;
  String? streetNumber;
  String? streetName;
  String? nearestLandMark;
  String? blockNearestCrossStreets;
  String? areaSuburb;
  String? city;

  HouseholdAddress();
}

class HouseholdQuestions {
  late String qh1DwellingDescriptionType;
  late String qh2DwellingType;
  late int qh3BedRoomNumber;
  late int qh4FamiliesNumber;
  List<SeparateFamiliesPeopleNumber>? q5separateFamiliesPeopleNumber;
  late String yearsNumberInAddress;
  late String demolishedAreas;

  BikesType? pedalCycles;
  BikesType? electricCycles;
  BikesType? electricScooter;
  late String totalIncome;

  HouseholdQuestions();
}

class SeparateFamiliesPeopleNumber {
  int? numberChildren;
  int? numberAdults;

  SeparateFamiliesPeopleNumber();
}

class BikesType {
  int? totalBikesNumber;
  int? adultsBikesNumber;
  int? childrenBikesNumber;

  BikesType();
}

abstract class Survey {
  String id = "";
  late HeaderBase header;
  late HouseholdQuestions householdQuestions;
  bool synced = false;
  late SurveyProvider provider;

  set suggestionName(String suggestionName) {}

  set journeyStarDistrictName(String? journeyStarDistrictName) {}

  set journeyEndDistrictName(String? journeyEndDistrictName) {}

  Map<String, dynamic> toJson();
}
