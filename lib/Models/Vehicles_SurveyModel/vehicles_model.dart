class VehiclesModel {
  String? numberParcels;

  String? nearestBusStop;

  VehiclesModel({
    this.nearestBusStop,
    this.numberParcels,
  });

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    numberParcels = json['numberParcels'] ?? "";
    nearestBusStop = json['nearestBusStop'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['numberParcels'] = numberParcels ?? "";
    data['nearestBusStop'] = nearestBusStop ?? '';
    return data;
  }
}
