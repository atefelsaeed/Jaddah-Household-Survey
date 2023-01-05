import 'package:jaddah_household_survey/Models/Trips_SurveyModel/start_beginning_model.dart';

class TripsModel {
  StartBeginningModel? startBeginningModel;
  StartBeginningModel? endingAddress;
  String? purposeTravel;
  String? departureTime;
  String? tripReason;
  TravelWay? travelWay;
  ArrivalDepartTime? arrivalDepartTime;

  TripsModel();

  TripsModel.fromJson(Map<String, dynamic> json) {
    startBeginningModel =
        StartBeginningModel.fromJson(json['startBeginningModel']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['startBeginningModel'] = startBeginningModel!.toJson();
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

class ArrivalDepartTime {
  String? departTime;
  String? arriveDestinationTime;
  String? numberRepeatTrip;

  ArrivalDepartTime();

  ArrivalDepartTime.fromJson(Map<String, dynamic> json) {
    departTime = json['departTime'];
    arriveDestinationTime = json['arriveDestinationTime'];
    numberRepeatTrip = json['numberRepeatTrip'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['departTime'] = departTime;
    data['numberRepeatTrip'] = numberRepeatTrip;
    return data;
  }
}
