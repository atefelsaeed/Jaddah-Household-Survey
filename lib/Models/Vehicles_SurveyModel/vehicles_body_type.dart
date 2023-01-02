class VehiclesBodyType {
  late String vehicleTypeName;
  late int vehicleTypeQuantity;
  late List<VehicleBodyDetails> vehicleTypeDetails;

  VehiclesBodyType();

  VehiclesBodyType.fromJson(Map<String, dynamic> json) {
    vehicleTypeName = json['vehicleTypeName'];
    vehicleTypeQuantity = json['vehicleTypeQuantity'];
    vehicleTypeDetails = json['vehicleTypeDetails']
        .map<VehicleBodyDetails>(
            (e) => VehicleBodyDetails.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleTypeName'] = vehicleTypeName;
    data['vehicleTypeQuantity'] = vehicleTypeQuantity;
    data['vehicleTypeDetails'] =
        vehicleTypeDetails.map((e) => e.toJson()).toList();
    return data;
  }
}

class VehicleBodyDetails {
  late String vehicleFuel;
  late String vehicleModel;
  late String vehicleAnnualMileage;
  late String vehicleAge;
  late bool vehicleIsHousehold;
  late String vehicleOwner;

  VehicleBodyDetails();

  VehicleBodyDetails.fromJson(Map<String, dynamic> json) {
    vehicleFuel = json['vehicleFuel'];
    vehicleModel = json['vehicleModel'];
    vehicleAnnualMileage = json['vehicleAnnualMileage'];
    vehicleAge = json['vehicleAge'];
    vehicleIsHousehold = json['vehicleIsHousehold'];
    vehicleOwner = json['vehicleOwner'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleFuel'] = vehicleFuel;
    data['vehicleModel'] = vehicleModel;
    data['vehicleAnnualMileage'] = vehicleAnnualMileage;
    data['vehicleAge'] = vehicleAge;
    data['vehicleIsHousehold'] = vehicleIsHousehold;
    data['vehicleOwner'] = vehicleOwner;
    return data;
  }
}
