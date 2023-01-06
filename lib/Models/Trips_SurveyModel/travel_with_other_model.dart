class TravelWithOtherModel {
  int? adultsNumber;
  int? childrenNumber;
  String? hhsMembersTraveled;
  int? nonHHSAdultsNumber;
  int? nonHHSChildrenNumber;

  TravelWithOtherModel();

  TravelWithOtherModel.fromJson(Map<String, dynamic> json) {
    adultsNumber = json['adultsNumber'];
    childrenNumber = json['childrenNumber'];
    hhsMembersTraveled = json['hhsMembersTraveled'];
    nonHHSAdultsNumber = json['nonHHSAdultsNumber'];
    nonHHSChildrenNumber = json['nonHHSChildrenNumber'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['adultsNumber'] = adultsNumber;
    data['childrenNumber'] = childrenNumber;
    data['hhsMembersTraveled'] = hhsMembersTraveled;
    data['nonHHSAdultsNumber'] = nonHHSAdultsNumber;
    data['nonHHSChildrenNumber'] = nonHHSChildrenNumber;
    return data;
  }
}

class TravelWay {
  String? mainMode;
  String? accessMode;

  TravelWay();

  TravelWay.fromJson(Map<String, dynamic> json) {
    mainMode = json['mainMode'];
    mainMode = json['accessMode'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['mainMode'] = mainMode;
    data['accessMode'] = accessMode;
    return data;
  }
}
