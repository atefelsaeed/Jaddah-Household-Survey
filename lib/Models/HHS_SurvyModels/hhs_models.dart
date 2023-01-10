class HouseholdAddress {
  String? buildingName;
  String? streetNumber;
  String? streetName;
  String? nearestLandMark;
  String? blockNearestCrossStreets;
  String? areaSuburb;
  String? city;

  HouseholdAddress(
      {this.nearestLandMark,
      this.streetNumber,
      this.buildingName,
      this.streetName,
      this.city,
      this.areaSuburb,
      this.blockNearestCrossStreets});
}

class HouseholdQuestions {
String? hhsDwellingType;
   String? hhsIsDwelling;
   int? hhsNumberBedRooms;
  int? hhsNumberSeparateFamilies;
 int? hhsNumberAdults;
 String? hhsNumberChildren="";
 String? hhsNumberYearsInAddress;
 bool? hhsIsDemolishedAreas;
   String? hhsDemolishedAreas;

  BikesType? hhsPedalCycles;
  BikesType? hhsElectricCycles;
  BikesType? hhsElectricScooter;
  String? hhsTotalIncome;

  HouseholdQuestions(
      { this.hhsDwellingType,
    this.hhsIsDwelling,
   this.hhsNumberBedRooms,
     this.hhsNumberSeparateFamilies,
      this.hhsTotalIncome,
       this.hhsNumberYearsInAddress,
     this.hhsElectricCycles,
    this.hhsElectricScooter,
 this.hhsPedalCycles,
 this.hhsDemolishedAreas,
 this.hhsIsDemolishedAreas,
  this.hhsNumberChildren,
    this.hhsNumberAdults});
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

  SeparateFamilies(this.numberAdults,this.numberChildren,this.totalNumberVehicles);

  SeparateFamilies.fromJson(Map<String, dynamic> json) {
    numberChildren = json['numberChildren'] ?? 0;
    numberAdults = json['numberAdults'] ?? 0;
    totalNumberVehicles = json['totalNumberVehicles'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['numberChildren'] = numberChildren ?? 0;
    data['numberAdults'] = numberAdults ?? 0;
    data['totalNumberVehicles'] = totalNumberVehicles ?? 0;
    return data;
  }
}

class HhsStatic {
  static HouseholdAddress householdAddress = HouseholdAddress();
  static HouseholdQuestions householdQuestions=HouseholdQuestions();
  static List<SeparateFamilies> houseHold=[];
}
