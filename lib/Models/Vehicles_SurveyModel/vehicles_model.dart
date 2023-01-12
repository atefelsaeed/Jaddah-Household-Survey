

class VehiclesModel {

  String? vehicleFuelType;
  String? vehicleOwnership;
  String? vehicleParking;
  String? numberAirTubedAdultsWorkUse;
  String? numberAirTubedAdultsLeisure;
  String? numberAirTubedChildren;
  String? nearestBusStop;

  VehiclesModel({

    this.numberAirTubedChildren,
    this.numberAirTubedAdultsLeisure,
    this.numberAirTubedAdultsWorkUse,
    this.vehicleFuelType,
    this.nearestBusStop,
    this.vehicleOwnership,
    this.vehicleParking,
  });

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    vehicleFuelType = json['vehicleFuelType'] ?? '';
    vehicleOwnership = json['vehicleOwnership'] ?? '';
    vehicleParking = json['vehicleParking'] ?? '';
    numberAirTubedAdultsWorkUse = json['numberAirTubedAdultsWorkUse'] ?? 0;
    numberAirTubedAdultsLeisure = json['numberAirTubedAdultsLeisure'] ?? 0;
    numberAirTubedChildren = json['numberAirTubedChildren'] ?? 0;
    nearestBusStop = json['nearestBusStop'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleFuelType'] = vehicleFuelType ?? '';
    data['vehicleOwnership'] = vehicleOwnership ?? '';
    data['vehicleParking'] = vehicleParking ?? '';
    data['numberAirTubedAdultsWorkUse'] = numberAirTubedAdultsWorkUse ?? 0;
    data['numberAirTubedAdultsLeisure'] = numberAirTubedAdultsLeisure ?? 0;
    data['numberAirTubedChildren'] = numberAirTubedChildren ?? 0;
    data['nearestBusStop'] = nearestBusStop ?? '';
    return data;
  }
}
