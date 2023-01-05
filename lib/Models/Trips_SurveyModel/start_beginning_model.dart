class StartBeginningModel {
  String? buildingName;
  String? streetName;
  String? streetNumber;
  String? nearestLandMark;
  String? block;
  String? area;
  String? city;
  String? referToMap;

  StartBeginningModel();

  StartBeginningModel.fromJson(Map<String, dynamic> json) {
    buildingName = json['buildingName'];
    streetName = json['streetName'];
    streetNumber = json['streetNumber'];
    nearestLandMark = json['nearestLandMark'];
    block = json['block'];
    area = json['area'];
    city = json['city'];
    referToMap = json['referToMap'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['buildingName'] = buildingName;
    data['streetName'] = streetName;
    data['streetNumber'] = streetNumber;
    data['nearestLandMark'] = nearestLandMark;
    data['block'] = block;
    data['area'] = area;
    data['city'] = city;
    data['referToMap'] = referToMap;
    return data;
  }
}
