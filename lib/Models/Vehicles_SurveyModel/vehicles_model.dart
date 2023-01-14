

class VehiclesModel {

  String? vehicleFuelType;
  String? vehicleOwnership;
  String? vehicleParking;
  String? numberAirTubedAdultsWorkUse;
  String? numberAirTubedAdultsLeisure;
  String? numberParcels;
  String? numberAirTubedChildren;
  String? nearestBusStop;

  VehiclesModel({

    this.numberAirTubedChildren,
    this.numberAirTubedAdultsLeisure,
    this.numberAirTubedAdultsWorkUse,
    this.vehicleFuelType,
    this.nearestBusStop,
    this.numberParcels,
    this.vehicleOwnership,
    this.vehicleParking,
  });

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    vehicleFuelType = json['vehicleFuelType'] ?? '';
    vehicleOwnership = json['vehicleOwnership'] ?? '';
    vehicleParking = json['vehicleParking'] ?? '';
    numberAirTubedAdultsWorkUse = json['numberAirTubedAdultsWorkUse'] ?? "";
    numberAirTubedAdultsLeisure = json['numberAirTubedAdultsLeisure'] ?? "";
    numberAirTubedChildren = json['numberAirTubedChildren'] ?? "";
    numberParcels = json['numberParcels'] ?? "";//last is numberAirTubedAdultsLeisure
    nearestBusStop = json['nearestBusStop'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleFuelType'] = vehicleFuelType ?? '';
    data['vehicleOwnership'] = vehicleOwnership ?? '';
    data['vehicleParking'] = vehicleParking ?? '';
    data['numberAirTubedAdultsWorkUse'] = numberAirTubedAdultsWorkUse ?? "";
    data['numberParcels'] = numberParcels ??"";
    data['numberAirTubedAdultsLeisure'] = numberAirTubedAdultsLeisure ?? "";
    data['numberAirTubedChildren'] = numberAirTubedChildren ?? "";
    data['nearestBusStop'] = nearestBusStop ?? '';
    return data;
  }
}
