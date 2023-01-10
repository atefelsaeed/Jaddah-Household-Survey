import 'vehicles_body_type.dart';

class VehiclesModel {
  List<VehiclesBodyType>? vehiclesBodyType;
  String? vehicleFuelType;
  String? vehicleOwnership;
  String? vehicleParking;
  String? numberAirTubedAdultsWorkUse;
  String? numberAirTubedAdultsLeisure;
  String? numberAirTubedChildren;
  String? nearestBusStop;

  VehiclesModel({
    this.vehiclesBodyType,
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
    vehiclesBodyType = json['vehiclesBodyType']
            .map<VehiclesBodyType>(
                (e) => VehiclesBodyType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
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
    // data['vehiclesBodyType'] =
    //     vehiclesBodyType!.map((e) => e.toJson()).toList();
    return data;
  }
}
