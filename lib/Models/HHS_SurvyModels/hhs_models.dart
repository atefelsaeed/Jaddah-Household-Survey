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
  late String hhsDwellingType;
  late String hhsIsDwelling;
  late int hhsNumberBedRooms;
  late int hhsNumberSeparateFamilies;
  late int hhsNumberAdults;
  late int hhsNumberChildren;
  late String hhsNumberYearsInAddress;
  late bool hhsIsDemolishedAreas;
  String? hhsDemolishedAreas;

  BikesType? hhsPedalCycles;
  BikesType? hhsElectricCycles;
  BikesType? hhsElectricScooter;
  late String hhsTotalIncome;

  HouseholdQuestions();
}

class BikesType {
  int? totalBikesNumber;
  int? adultsBikesNumber;
  int? childrenBikesNumber;

  BikesType();
}

class SeparateFamilies {
  int? numberChildren;
  int? numberAdults;
  int? totalNumberVehicles;

  SeparateFamilies();

  SeparateFamilies.fromJson(Map<String, dynamic> json) {
    numberChildren = json['numberChildren'];
    numberAdults = json['numberAdults'];
    totalNumberVehicles = json['totalNumberVehicles'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['numberChildren'] = numberChildren;
    data['numberAdults'] = numberAdults;
    data['totalNumberVehicles'] = totalNumberVehicles;
    return data;
  }
}
