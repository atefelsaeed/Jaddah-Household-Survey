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
  String? hhsNumberBedRooms;
  String? hhsNumberSeparateFamilies;
  String? hhsNumberAdults;
  String? hhsNumberChildren = "";
  String? hhsNumberYearsInAddress;
  bool? hhsIsDemolishedAreas;
  String? hhsDemolishedAreas;

  BikesType hhsPedalCycles =BikesType("", "", "") ;
  BikesType hhsElectricCycles=BikesType("", "", "") ;
  BikesType hhsElectricScooter=BikesType("", "", "") ;
  String? hhsTotalIncome;

  HouseholdQuestions(
      {this.hhsDwellingType,
      this.hhsIsDwelling,
      this.hhsNumberBedRooms,
      this.hhsNumberSeparateFamilies,
      this.hhsTotalIncome,
      this.hhsNumberYearsInAddress,
     required this.hhsElectricCycles,
     required this.hhsElectricScooter,
    required  this.hhsPedalCycles,
      this.hhsDemolishedAreas,
      this.hhsIsDemolishedAreas,
      this.hhsNumberChildren,
      this.hhsNumberAdults});
}

class BikesType {
late  String totalBikesNumber;
 late String adultsBikesNumber;
late  String childrenBikesNumber;

  BikesType( this.adultsBikesNumber,this.totalBikesNumber,this.childrenBikesNumber);
}

class SeparateFamilies {
  String? numberChildren;
  String? numberAdults;
  String? totalNumberVehicles;

  SeparateFamilies(
      this.numberAdults, this.numberChildren, this.totalNumberVehicles);

  SeparateFamilies.fromJson(Map<String, dynamic> json) {
    numberChildren = json['numberChildren'] ?? 0;
    numberAdults = json['numberAdults'] ?? 0;
    totalNumberVehicles = json['totalNumberVehicles'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['numberChildren'] = numberChildren;
    data['numberAdults'] = numberAdults;
    data['totalNumberVehicles'] = totalNumberVehicles;
    return data;
  }
}

class HhsStatic {
  static HouseholdAddress householdAddress = HouseholdAddress();
  static HouseholdQuestions householdQuestions = HouseholdQuestions(hhsPedalCycles:BikesType("", "", "")  ,
      hhsElectricCycles: BikesType("", "", "") ,hhsElectricScooter:  BikesType("", "", "") );
  static List<SeparateFamilies> houseHold = [];
  static  BikesType hhsPedalCycles=BikesType("", "", "") ;
  static  BikesType hhsElectricCycles=BikesType("", "", "") ;
  static BikesType hhsElectricScooter=BikesType("", "", "") ;
}
