import 'vehicles_body_type.dart';

class VehiclesModel {
  late VehiclesBodyType vehiclesBodyType;
  late String vehicleFuelType;
  late String vehicleOwnership;
  late String vehicleParking;
  int? numberAirTubedAdultsWorkUse;
  int? numberAirTubedAdultsLeisure;
  int? numberAirTubedChildren;
  late String nearestBusStop;

  VehiclesModel();

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    vehicleFuelType = json['vehicleFuelType'];
    vehicleOwnership = json['vehicleOwnership'];
    vehicleParking = json['vehicleParking'];
    numberAirTubedAdultsWorkUse = json['numberAirTubedAdultsWorkUse'];
    numberAirTubedAdultsLeisure = json['numberAirTubedAdultsLeisure'];
    numberAirTubedChildren = json['numberAirTubedChildren'];
    nearestBusStop = json['nearestBusStop'];
    vehiclesBodyType = VehiclesBodyType.fromJson(json['vehiclesBodyType']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleFuelType'] = vehicleFuelType;
    data['vehicleOwnership'] = vehicleOwnership;
    data['vehicleParking'] = vehicleParking;
    data['numberAirTubedAdultsWorkUse'] = numberAirTubedAdultsWorkUse;
    data['numberAirTubedAdultsLeisure'] = numberAirTubedAdultsLeisure;
    data['numberAirTubedChildren'] = numberAirTubedChildren;
    data['nearestBusStop'] = nearestBusStop;
    data['vehiclesBodyType'] = vehiclesBodyType.toJson();
    return data;
  }
}
