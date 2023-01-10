import 'package:flutter/material.dart';

class VehiclesBodyType {
  String? vehicleTypeName;
  int? vehicleTypeQuantity;
  List<VehicleBodyDetails>? vehicleTypeDetails;

  VehiclesBodyType({
    this.vehicleTypeName,
    this.vehicleTypeQuantity,
    this.vehicleTypeDetails,
  });

  VehiclesBodyType.fromJson(Map<String, dynamic> json) {
    vehicleTypeName = json['vehicleTypeName'] ?? '';
    vehicleTypeQuantity = json['vehicleTypeQuantity'] ?? '';
    vehicleTypeDetails = json['vehicleTypeDetails']
            .map<VehicleBodyDetails>(
                (e) => VehicleBodyDetails.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleTypeName'] = vehicleTypeName ?? '';
    data['vehicleTypeQuantity'] = vehicleTypeQuantity ?? '';
    data['vehicleTypeDetails'] =
        vehicleTypeDetails!.map((e) => e.toJson()).toList();
    return data;
  }
}

class VehicleBodyDetails {
  TextEditingController? vehicleFuel;
  TextEditingController? vehicleModel;
  TextEditingController? vehicleAnnualMileage;
  TextEditingController? vehicleAge;
  bool? vehicleIsHousehold;
  TextEditingController? vehicleOwner;

  VehicleBodyDetails({
    this.vehicleFuel,
    this.vehicleAge,
    this.vehicleAnnualMileage,
    this.vehicleIsHousehold,
    this.vehicleModel,
    this.vehicleOwner,
  });

  VehicleBodyDetails.fromJson(Map<String, dynamic> json) {
    vehicleFuel = json['vehicleFuel'] ?? '';
    vehicleModel = json['vehicleModel'] ?? '';
    vehicleAnnualMileage = json['vehicleAnnualMileage'] ?? '';
    vehicleAge = json['vehicleAge'] ?? '';
    vehicleIsHousehold = json['vehicleIsHousehold'] ?? false;
    vehicleOwner = json['vehicleOwner'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleFuel'] = vehicleFuel ?? '';
    data['vehicleModel'] = vehicleModel ?? '';
    data['vehicleAnnualMileage'] = vehicleAnnualMileage ?? '';
    data['vehicleAge'] = vehicleAge ?? '';
    data['vehicleIsHousehold'] = vehicleIsHousehold ?? false;
    data['vehicleOwner'] = vehicleOwner ?? '';
    return data;
  }
}
