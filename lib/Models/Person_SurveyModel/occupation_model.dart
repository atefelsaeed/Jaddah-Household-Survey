import 'package:flutter/material.dart';

class OccupationModel {
  String? occupationSector;
  String? isEmployee;
  String? occupationLevelSector;
  String? bestWorkspaceLocation;
  int? commuteWorkDays;
  int? bikeWorkDays;
  TextEditingController? address;
  TextEditingController? geoCodes;
  bool? isWorkFromHome;
  int? numberWorkFromHome;
  TextEditingController? startingWoke;
  TextEditingController? endingWoke;
  String? flexibleWorkingHours;
  TextEditingController? earliestTimeStartingWork;
  TextEditingController? earliestTimeFinishingWork;
  TextEditingController? mainOccupationAddress;

  OccupationModel({
    this.earliestTimeFinishingWork,
    this.endingWoke,
    this.startingWoke,
    this.address,
    this.geoCodes,
    this.mainOccupationAddress,
    this.bestWorkspaceLocation,
    this.bikeWorkDays,
    this.commuteWorkDays,
    this.earliestTimeStartingWork,
    this.flexibleWorkingHours,
    this.isEmployee,
    this.isWorkFromHome,
    this.numberWorkFromHome,
    this.occupationLevelSector,
    this.occupationSector,
  });

  OccupationModel.fromJson(Map<String, dynamic> json) {
    occupationSector = json['occupationSector'] ?? "";
    isEmployee = json['isEmployee'] ?? "";
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
    data['isEmployee'] = isEmployee ?? "";
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
