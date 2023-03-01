import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/trips_model.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Widgets/show_dialog_error.dart';

class TripProvider extends ChangeNotifier {
  List<String> personTrip = [];

  getAllTripUpdated(BuildContext context) async {
    UserSurveysProvider surveyPt =
        Provider.of<UserSurveysProvider>(context, listen: false);

    TripModeList.tripModeList = [];

    for (int i = 0; i < surveyPt.surveyPT.tripsList!.length; i++) {
      Map<String, dynamic> travelWithOther = {
        'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
            [
          {"value": 'مع الأخرين', "isChick": false},
          {"value": 'بمفردك', "isChick": false},
        ],
        "index": 0
      };
      Map<String, dynamic> purposeOfBeingThere2 = {
        "TripReason": [
          {"value": 'في المنزل', "isChick": false},
          {"value": 'فى بيت العطلات / الفندق', "isChick": false},
          {"value": 'العمل - فى مكتب / مقر العمل', "isChick": false},
          {"value": 'العمل - خارج مكتب / مقر العمل', "isChick": false},
          {"value": 'مكان تعليمى', "isChick": false},
          {"value": 'التسوق', "isChick": false},
          {"value": 'عمل شخصي', "isChick": false},
          {"value": 'طبى / مستشفى', "isChick": false},
          {"value": 'زیارة الأصدقاء / الأقارب', "isChick": false},
          {"value": 'ترفيه / وقت الفراغ', "isChick": false},
          {"value": 'توصيل الى المدرسة / التعليم', "isChick": false},
          {"value": 'توص الى المدرسة / التعليم', "isChick": false},
          {"value": 'توصيل الى مكان آخر', "isChick": false},
          {"value": 'توص الى مكان آخر', "isChick": false},
          {"value": 'آخرى', "isChick": false},
        ],
        "title": "?What was the purpose of being there",
        "subTitle":
            " A separate family is defined as who share the kitchen expenses and meals",
        "chosenIndex": 0,
      };
      Map<String, dynamic> purposeOfBeingThere = {
        "QPurposeOfBeingThere": [
          {"value": 'في المنزل', "isChick": false},
          {"value": 'فى بيت العطلات / الفندق', "isChick": false},
          {"value": 'العمل - فى مكتب / مقر العمل', "isChick": false},
          {"value": 'العمل - خارج مكتب / مقر العمل', "isChick": false},
          {"value": 'مكان تعليمى', "isChick": false},
          {"value": 'التسوق', "isChick": false},
          {"value": 'عمل شخصي', "isChick": false},
          {"value": 'طبى / مستشفى', "isChick": false},
          {"value": 'زیارة الأصدقاء / الأقارب', "isChick": false},
          {"value": 'ترفيه / وقت الفراغ', "isChick": false},
          {"value": 'توصيل الى المدرسة / التعليم', "isChick": false},
          {"value": 'توصيل الى مكان آخر', "isChick": false},
          {"value": 'توص الى المدرسة / التعليم', "isChick": false},
          {"value": 'توص الى مكان آخر', "isChick": false},
          {"value": 'آخرى', "isChick": false},
        ],
        "title": "?What was the purpose of being there",
        "subTitle":
            " A separate family is defined as who share the kitchen expenses and meals",
        "chosenIndex": 0,
      };

      List value2 =
          purposeOfBeingThere[purposeOfBeingThere.keys.first].toList();

      for (int inr = 0; inr < value2.length; inr++) {
        if (surveyPt.surveyPT.tripsList![i].tripReason ==
            value2[inr]["value"]) {
          purposeOfBeingThere[purposeOfBeingThere.keys.first].toList()[inr]
              ["isChick"] = true;
          //  nationalityu.addAll(  {"value":  value2[inr]["value"], "isChick": true});
        } else {
          purposeOfBeingThere[purposeOfBeingThere.keys.first].toList()[inr]
              ["isChick"] = false;
        }
        //  notifyListeners();
      }

      List value3 =
          purposeOfBeingThere2[purposeOfBeingThere2.keys.first].toList();

      surveyPt.surveyPT.tripsList![i].purposeTravel;

      for (int ir = 0; ir < value3.length; ir++) {
        if (surveyPt.surveyPT.tripsList![i].purposeTravel ==
            value3[ir]["value"]) {
          purposeOfBeingThere2[purposeOfBeingThere2.keys.first].toList()[ir]
              ["isChick"] = true;

          //  nationalityu.addAll(  {"value":  value2[inr]["value"], "isChick": true});
        } else {
          purposeOfBeingThere2[purposeOfBeingThere2.keys.first].toList()[ir]
              ["isChick"] = false;
        }
      }
      TripModeList.tripModeList.add(TripsModel(
          person: surveyPt.surveyPT.tripsList![i].person,
          isHome: surveyPt.surveyPT.tripsList![i].isHome,
          isHomeEnding: surveyPt.surveyPT.tripsList![i].isHomeEnding,
          chosenFriendPerson:
              surveyPt.surveyPT.tripsList![i].chosenFriendPerson,
          chosenPerson: surveyPt.surveyPT.tripsList![i].chosenPerson,
          purposeOfBeingThere: purposeOfBeingThere,
          purposeTravel: surveyPt.surveyPT.tripsList![i].purposeTravel,
          tripReason: surveyPt.surveyPT.tripsList![i].tripReason,
          startBeginningModel:
              surveyPt.surveyPT.tripsList![i].startBeginningModel,
          hhsMembersTraveled:
              surveyPt.surveyPT.tripsList![i].hhsMembersTraveled,
          travelAloneHouseHold:
              surveyPt.surveyPT.tripsList![i].travelAloneHouseHold,
          travelWay: surveyPt.surveyPT.tripsList![i].travelWay,
          type: surveyPt.surveyPT.tripsList![i].type,
          endingAddress: surveyPt.surveyPT.tripsList![i].endingAddress,
          travelWithOtherModel:
              surveyPt.surveyPT.tripsList![i].travelWithOtherModel,
          typeTravel: surveyPt.surveyPT.tripsList![i].typeTravel,
          typeTravelCondition:
              surveyPt.surveyPT.tripsList![i].typeTravelCondition,
          isTravelAlone: surveyPt.surveyPT.tripsList![i].isTravelAlone,
          travelWithOther: surveyPt.surveyPT.tripsList![i].isTravelAlone == true
              ? {
                  'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
                      [
                    {"value": 'مع الأخرين', "isChick": true},
                    {"value": 'بمفردك', "isChick": false},
                  ],
                  "index": 0
                }
              : {
                  'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
                      [
                    {"value": 'مع الأخرين', "isChick": false},
                    {"value": 'بمفردك', "isChick": true},
                  ],
                  "index": 0
                },
          travelTypeModel: surveyPt.surveyPT.tripsList![i].travelTypeModel,
          otherWhereDidYouParkEditingControl: surveyPt
              .surveyPT.tripsList![i].otherWhereDidYouParkEditingControl,
          taxiTravelTypeEditingControl:
              surveyPt.surveyPT.tripsList![i].taxiTravelTypeEditingControl,
          arrivalDepartTime: surveyPt.surveyPT.tripsList![i].arrivalDepartTime,
          purposeOfBeingThere2: purposeOfBeingThere2,
          departureTime: surveyPt.surveyPT.tripsList![i].departureTime));
    }

    // notifyListeners();
  }

  removeTrip(int i) {
    TripModeList.tripModeList.removeAt(i);
    notifyListeners();
  }

  initTrip() {
    TripModeList.tripModeList[0].person = [];
    for (int i = 0; i < PersonModelList.personModelList.length; i++) {
      TripModeList.tripModeList[0].person
          .add(PersonModelList.personModelList[i].personName.text);
    }
    // notifyListeners();
  }

  addOwnerTrip(int i, String p) {
    TripModeList.tripModeList[i].friendPerson["friendPerson"] = [];
    for (int x = 0; x < TripModeList.tripModeList[i].person.length; x++) {
      if (TripModeList.tripModeList[i].person[x].toString() != p) {
        TripModeList.tripModeList[i].friendPerson["friendPerson"].add({
          "value": TripModeList.tripModeList[i].person[x],
          "isChick": false
        });
      }
    }

    TripModeList.tripModeList[i].chosenPerson = p;

    notifyListeners();
  }

  ///Search Map
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    notifyListeners();
    return await Geolocator.getCurrentPosition();
  }

  activeLocation(List<Placemark> placeMarks, BuildContext context,
      LatLng? value1, callBack) async {
    placeMarks =
        await placemarkFromCoordinates(value1!.latitude, value1.longitude)
            .then((value) async {
      await callBack(value);
      notifyListeners();
      return value;
    });
  }

  isTravelAlone(int index, ChangeBoxResponse r, BuildContext context) {
    debugPrint('chosenPerson');
    debugPrint(TripModeList.tripModeList[index].chosenPerson);
    if (TripModeList.tripModeList[index].chosenPerson.isNotEmpty) {
      if (r.val == "بمفردك") {
        TripModeList.tripModeList[index].isTravelAlone = false;
      } else if (r.val == "مع الأخرين" && r.check == true) {
        TripModeList.tripModeList[index].isTravelAlone = true;
      } else {
        TripModeList.tripModeList[index].isTravelAlone = null;
      }
    } else {
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return const ShowErrorDialog(
              title: 'لا يمكنك الإختيار',
              content:
                  'يجب عليك إختيار إسم صاحب الرحلة أولا ثم المحاولة مرة أخرى!',
            );
          });

      TripModeList
                  .tripModeList[index]
                  .travelWithOther[TripModeList
                      .tripModeList[index].travelWithOther.keys.first]!
                  .toList()[
              TripModeList.tripModeList[index].travelWithOther['index']]
          ["isChick"] = false;

      debugPrint('no user');
      return false;
    }
    notifyListeners();
  }
}
