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