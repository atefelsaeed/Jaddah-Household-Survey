class PersonalQuestion {
  String? haveBusPass;
  String? haveDisabilityTransportMobility;
  String? drivingLicenceType; //if age>17
  String? mainOccupationType; //if age>15
  String? availablePersonalCar; //if user have driving licence
  String? asPassenger; //if user do not have driving licence
  bool? haveCarSharing;
  EducationAddress? educationAddress; //if age <15

  PersonalQuestion();

  PersonalQuestion.fromJson(Map<String, dynamic> json) {
    drivingLicenceType = json['drivingLicenceType'] ?? "";
    haveDisabilityTransportMobility =
        json['haveDisabilityTransportMobility'] ?? "";
    haveBusPass = json['haveBusPass'] ?? "";
    mainOccupationType = json['mainOccupationType'] ?? "";
    availablePersonalCar = json['availablePersonalCar'] ?? "";
    haveCarSharing = json['haveCarSharing'] ?? "";
    educationAddress = (EducationAddress.fromJson(json['educationAddress']));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['drivingLicenceType'] = drivingLicenceType ?? "";
    data['haveBusPass'] = haveBusPass ?? "";
    data['mainOccupationType'] = mainOccupationType ?? "";
    data['availablePersonalCar'] = availablePersonalCar ?? "";
    data['haveCarSharing'] = haveCarSharing ?? "";
    data['educationAddress'] = educationAddress!.toJson();
    return data;
  }
}

class EducationAddress {
  String? fullAddress;
  String? geocodes;

  EducationAddress();

  EducationAddress.fromJson(Map<String, dynamic> json) {
    fullAddress = json['fullAddress'] ?? "";
    geocodes = json['geocodes'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['fullAddress'] = fullAddress ?? "";
    data['geocodes'] = geocodes ?? "";
    return data;
  }
}
