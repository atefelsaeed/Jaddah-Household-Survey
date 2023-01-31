

class StartBeginningModel {
  String? tripAddressLat ;
  String? tripAddressLong;

  StartBeginningModel({
    required this.tripAddressLong,
    required this.tripAddressLat,
  });

  StartBeginningModel.fromJson(Map<String, dynamic> json) {
    tripAddressLat = json['tripAddressLat'];
    tripAddressLong = json['tripAddressLong'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['tripAddressLat'] = tripAddressLat;
    data['tripAddressLong'] = tripAddressLong;
    return data;
  }
}
