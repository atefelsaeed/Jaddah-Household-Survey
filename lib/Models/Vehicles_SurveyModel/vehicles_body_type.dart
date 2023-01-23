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
    vehicleTypeDetails = List.from(json['vehicleTypeDetails'])
        .map((e) => VehicleBodyDetails.fromJson(e))
        .toList();
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
  TextEditingController vehicleFuel = TextEditingController();
  TextEditingController vehicleModel = TextEditingController();
  TextEditingController vehicleAnnualMileage = TextEditingController();
  TextEditingController fuelTypeCode = TextEditingController();
  bool? vehicleIsHousehold;
  TextEditingController vehicleOwner = TextEditingController();

  VehicleBodyDetails({
    required this.vehicleFuel,
    required this.fuelTypeCode,
    required this.vehicleAnnualMileage,
    this.vehicleIsHousehold,
    required this.vehicleModel,
    required this.vehicleOwner,
  });

  VehicleBodyDetails.fromJson(Map<String, dynamic> json) {
    vehicleFuel.text = json['vehicleFuel'];
    vehicleModel.text = json['vehicleModel'];
    vehicleAnnualMileage.text = json['vehicleAnnualMileage'];
    fuelTypeCode.text = json['vehicleAge'] ?? '';
    vehicleIsHousehold = json['vehicleIsHousehold'] ?? false;
    vehicleOwner.text = json['vehicleOwner'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleFuel'] = vehicleFuel.text;
    data['vehicleModel'] = vehicleModel.text;
    data['vehicleAnnualMileage'] = vehicleAnnualMileage.text;
    data['vehicleAge'] = fuelTypeCode.text;
    data['vehicleIsHousehold'] = vehicleIsHousehold ?? false;
    data['vehicleOwner'] = vehicleOwner.text;
    return data;
  }
}
