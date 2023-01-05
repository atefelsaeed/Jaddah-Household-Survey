import 'vehicles_body_type.dart';

class VehiclesModel {
  VehiclesBodyType? vehiclesBodyType;
  String? vehicleFuelType;
  String? vehicleOwnership;
  String? vehicleParking;
  int? numberAirTubedAdultsWorkUse;
  int? numberAirTubedAdultsLeisure;
  int? numberAirTubedChildren;
  String? nearestBusStop;

  VehiclesModel();

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    vehicleFuelType = json['vehicleFuelType'] ?? VehiclesModel();
    vehicleOwnership = json['vehicleOwnership'] ?? '';
    vehicleParking = json['vehicleParking'] ?? '';
    numberAirTubedAdultsWorkUse = json['numberAirTubedAdultsWorkUse'] ?? 0;
    numberAirTubedAdultsLeisure = json['numberAirTubedAdultsLeisure'] ?? 0;
    numberAirTubedChildren = json['numberAirTubedChildren'] ?? 0;
    nearestBusStop = json['nearestBusStop'] ?? '';
    vehiclesBodyType = VehiclesBodyType.fromJson(
        json['vehiclesBodyType'] );
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
    data['vehiclesBodyType'] = vehiclesBodyType!.toJson();
    return data;
  }
}
