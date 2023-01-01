import '../enum_survey.dart';

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
  late DwellingType hhsDwellingType;
  late IsDwelling hhsIsDwelling;
  late int hhsNumberBedRooms;
  late int hhsNumberSeparateFamilies;
  late int hhsNumberAdults;
  late int hhsNumberChildren;
  List<SeparateFamilies>? hhsSeparateFamilies;
  late NumberYearsInAddress hhsNumberYearsInAddress;
  late bool hhsIsDemolishedAreas;
  String? hhsDemolishedAreas;

  BikesType? hhsPedalCycles;
  BikesType? hhsElectricCycles;
  BikesType? hhsElectricScooter;
  late String hhsTotalIncome;

  HouseholdQuestions();
}

class SeparateFamilies {
  int? numberChildren;
  int? numberAdults;
  int? totalNumberVehicles;

  SeparateFamilies();
}

class BikesType {
  int? totalBikesNumber;
  int? adultsBikesNumber;
  int? childrenBikesNumber;

  BikesType();
}
