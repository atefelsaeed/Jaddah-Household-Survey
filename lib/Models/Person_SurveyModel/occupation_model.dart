class OccupationModel {
  String? occupationSector;
  String? occupationLevelSector;
  String? bestWorkspaceLocation;
  int? commuteWorkDays;
  int? bikeWorkDays;
  String? address;
  String? geoCodes;
  bool? isWorkFromHome;
  int? numberWorkFromHome;
  String? startingWoke;
  String? endingWoke;
  String? flexibleWorkingHours;
  String? earliestTimeStartingWork;
  String? earliestTimeFinishingWork;
  String? mainOccupationAddress;

  OccupationModel();

  OccupationModel.fromJson(Map<String, dynamic> json) {
    occupationSector = json['occupationSector'] ?? "";
    occupationLevelSector = json['occupationLevelSector'] ?? "";
    bestWorkspaceLocation = json['bestWorkspaceLocation'] ?? "";
    commuteWorkDays = json['commuteWorkDays'] ?? 0;
    bikeWorkDays = json['bikeWorkDays'] ?? 0;
    address = json['address'] ?? '';
    geoCodes = json['geoCodes'] ?? '';
    isWorkFromHome = json['isWorkFromHome'] ?? false;
    numberWorkFromHome = json['numberWorkFromHome'] ?? 0;
    startingWoke = json['startingWoke'] ?? '';
    endingWoke = json['endingWoke'] ?? '';
    flexibleWorkingHours = json['flexibleWorkingHours'] ?? '';
    earliestTimeStartingWork = json['earliestTimeStartingWork'] ?? '';
    earliestTimeFinishingWork = json['earliestTimeFinishingWork'] ?? '';
    mainOccupationAddress = json['mainOccupationAddress'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['occupationSector'] = occupationSector ?? "";
    data['occupationLevelSector'] = occupationLevelSector ?? "";
    data['bestWorkspaceLocation'] = bestWorkspaceLocation ?? "";
    data['commuteWorkDays'] = commuteWorkDays ?? 0;
    data['bikeWorkDays'] = bikeWorkDays ?? 0;
    data['address'] = address ?? '';
    data['geoCodes'] = geoCodes ?? '';
    data['isWorkFromHome'] = isWorkFromHome ?? false;
    data['numberWorkFromHome'] = numberWorkFromHome ?? 0;
    data['startingWoke'] = startingWoke ?? '';
    data['endingWoke'] = endingWoke ?? '';
    data['flexibleWorkingHours'] = flexibleWorkingHours ?? '';
    data['earliestTimeStartingWork'] = earliestTimeStartingWork ?? '';
    data['earliestTimeFinishingWork'] = earliestTimeFinishingWork ?? '';
    data['mainOccupationAddress'] = mainOccupationAddress ?? '';
    return data;
  }
}
