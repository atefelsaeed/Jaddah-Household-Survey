import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/start_beginning_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/travel_type_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/trips_model.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Data/app_constants.dart';
import '../../../Widgets/show_dialog_error.dart';

class TripProvider extends ChangeNotifier {
  List<String> personTrip = [];

  getTripsDataUpdated(context) async {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);

    final prefs = await SharedPreferences.getInstance();
    bool? isFilled = prefs.getBool(AppConstants.isFilled);

    if (isFilled != null && isFilled == true) {
      debugPrint('Not Filled Survey');
    } else if ((userSurveysProvider.userSurveyStatus == 'edit' &&
        AppConstants.isResetTrip == true)) {
      getAllTripUpdated(context);
      AppConstants.isResetTrip = false;
      debugPrint('Edit Survey');
    } else {
      debugPrint('New Survey');
    }
  }

  ///
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
          {"value": 'توصيل الى مكان آخر', "isChick": false},
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
          {"value": 'آخرى', "isChick": false},
        ],
        "title": "?What was the purpose of being there",
        "subTitle":
            " A separate family is defined as who share the kitchen expenses and meals",
        "chosenIndex": 0,
      };

      List value2 =
          purposeOfBeingThere[purposeOfBeingThere.keys.first].toList();

      surveyPt.surveyPT.tripsList![i].tripReason!.replaceAll('توص', 'توصيل');

      for (int inr = 0; inr < value2.length; inr++) {
        if (surveyPt.surveyPT.tripsList![i].tripReason!
                .replaceAll('توص', 'توصيل') ==
            value2[inr]["value"]) {
          purposeOfBeingThere[purposeOfBeingThere.keys.first].toList()[inr]
              ["isChick"] = true;
        } else {
          purposeOfBeingThere[purposeOfBeingThere.keys.first].toList()[inr]
              ["isChick"] = false;
        }
        //  notifyListeners();
      }

      List value3 =
          purposeOfBeingThere2[purposeOfBeingThere2.keys.first].toList();

      surveyPt.surveyPT.tripsList![i].purposeTravel!.replaceAll('توص', 'توصيل');

      for (int ir = 0; ir < value3.length; ir++) {
        if (surveyPt.surveyPT.tripsList![i].purposeTravel!
                .replaceAll('توص', 'توصيل') ==
            value3[ir]["value"]) {
          purposeOfBeingThere2[purposeOfBeingThere2.keys.first].toList()[ir]
              ["isChick"] = true;
        } else {
          purposeOfBeingThere2[purposeOfBeingThere2.keys.first].toList()[ir]
              ["isChick"] = false;
        }
      }

      print('chossen');
      surveyPt.surveyPT.tripsList![i].chosenPerson;
      var chosenPerson = surveyPt.surveyPT.tripsList![i].chosenPerson;
      var reason = surveyPt.surveyPT.tripsList![i].tripReason!
          .replaceAll('توص', 'توصيل');

      TripModeList.tripModeList.add(TripsModel(
          person: list,
          mainPerson: mainPersonList,
          isHome: surveyPt.surveyPT.tripsList![i].isHome,
          isHomeEnding: surveyPt.surveyPT.tripsList![i].isHomeEnding,
          chosenFriendPerson:
              surveyPt.surveyPT.tripsList![i].chosenFriendPerson,
          chosenPerson: chosenPerson,
          purposeOfBeingThere: purposeOfBeingThere,
          purposeTravel: surveyPt.surveyPT.tripsList![i].purposeTravel!
              .replaceAll('توص', 'توصيل'),
          tripReason: reason,
          startBeginningModel: StartBeginningModel(
            tripAddressLong: surveyPt
                .surveyPT.tripsList?[i].startBeginningModel?.tripAddressLong,
            tripAddressLat: surveyPt
                .surveyPT.tripsList?[i].startBeginningModel?.tripAddressLat,
            nearestLandMark: surveyPt.surveyPT.tripsList?[i].startBeginningModel
                    ?.nearestLandMark ??
                TextEditingController(),
            streetNumber: surveyPt
                    .surveyPT.tripsList?[i].startBeginningModel?.streetNumber ??
                TextEditingController(),
            streetName: surveyPt
                    .surveyPT.tripsList?[i].startBeginningModel?.streetName ??
                TextEditingController(),
            area: surveyPt.surveyPT.tripsList?[i].startBeginningModel?.area ??
                TextEditingController(),
            block: surveyPt.surveyPT.tripsList?[i].startBeginningModel?.block ??
                TextEditingController(),
          ),
          hhsMembersTraveled:
              surveyPt.surveyPT.tripsList![i].chosenFriendPerson,
          travelAloneHouseHold:
              surveyPt.surveyPT.tripsList![i].travelAloneHouseHold,
          travelWay: surveyPt.surveyPT.tripsList![i].travelWay,
          type: surveyPt.surveyPT.tripsList![i].type,
          endingAddress: StartBeginningModel(
            tripAddressLong:
                surveyPt.surveyPT.tripsList?[i].endingAddress?.tripAddressLong,
            tripAddressLat:
                surveyPt.surveyPT.tripsList?[i].endingAddress?.tripAddressLat,
            nearestLandMark: surveyPt
                    .surveyPT.tripsList?[i].endingAddress?.nearestLandMark ??
                TextEditingController(),
            streetNumber:
                surveyPt.surveyPT.tripsList?[i].endingAddress?.streetNumber ??
                    TextEditingController(),
            streetName:
                surveyPt.surveyPT.tripsList?[i].endingAddress?.streetName ??
                    TextEditingController(),
            area: surveyPt.surveyPT.tripsList?[i].endingAddress?.area ??
                TextEditingController(),
            block: surveyPt.surveyPT.tripsList?[i].endingAddress?.block ??
                TextEditingController(),
          ),
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
          travelTypeModel: TravelTypeModel(
            taxiTravelTypeOther: TextEditingController(
                text: surveyPt
                    .surveyPT.tripsList![i].travelTypeModel.taxiTravelType),
            otherWhereDidYouParking: TextEditingController(
                text: surveyPt
                    .surveyPT.tripsList![i].travelTypeModel.carParkingPlace),
            taxiFare: TextEditingController(
                text:
                    surveyPt.surveyPT.tripsList![i].travelTypeModel.travelType),
            ticketSub: TextEditingController(
                text: surveyPt
                    .surveyPT.tripsList![i].travelTypeModel.taxiTravelType),
            carParkingPlace:
                surveyPt.surveyPT.tripsList![i].travelTypeModel.carParkingPlace,
            passTravelType:
                surveyPt.surveyPT.tripsList![i].travelTypeModel.passTravelType,
            travelType:
                surveyPt.surveyPT.tripsList![i].travelTypeModel.travelType,
            publicTransportFare: surveyPt
                .surveyPT.tripsList![i].travelTypeModel.publicTransportFare,
            taxiTravelType:
                surveyPt.surveyPT.tripsList![i].travelTypeModel.taxiTravelType,
          ),
          otherWhereDidYouParkEditingControl: surveyPt
              .surveyPT.tripsList![i].otherWhereDidYouParkEditingControl,
          taxiTravelTypeEditingControl:
              surveyPt.surveyPT.tripsList![i].taxiTravelTypeEditingControl,
          arrivalDepartTime: surveyPt.surveyPT.tripsList![i].arrivalDepartTime,
          purposeOfBeingThere2: purposeOfBeingThere2,
          departureTime: surveyPt.surveyPT.tripsList![i].departureTime));

      // TripModeList.tripModeList[0].person.clear();

      /* for (int i = 0; i < PersonModelList.personModelList.length; i++) {
        TripModeList.tripModeList[0].person
            .add(PersonModelList.personModelList[i].personName.text);
      }*/

      TripModeList.tripModeList[i].friendPerson = {
        "friendPerson": [],
        "title": "friendPerson",
        "subTitle":
            " A separate family is defined as who share the kitchen expenses and meals",
        "index": 0,
      };
      if (surveyPt.surveyPT.tripsList![i].isTravelAlone = true) {
        for (int x = 0;
            x < surveyPt.surveyPT.tripsList![i].chosenFriendPerson.length;
            x++) {
          if (surveyPt.surveyPT.tripsList![i].chosenFriendPerson[x] !=
              surveyPt.surveyPT.tripsList![i].chosenPerson) {
            print("jjjjjiiii");
            TripModeList.tripModeList[i].friendPerson["friendPerson"].add({
              "value": surveyPt.surveyPT.tripsList![i].chosenFriendPerson[x]
                  .toString(),
              "isChick": true
            });
          }
        }
      }
    }

    notifyListeners();
  }

  removeTrip(int i) {
    TripModeList.tripModeList.removeAt(i);
    notifyListeners();
  }

  List<String> list = [];
  List<String> mainPersonList = [];

  initTrip() {
    TripModeList.tripModeList[0].person.clear();
    TripModeList.tripModeList[0].mainPerson.clear();

    list.clear();
    mainPersonList.clear();

    var personlist = PersonModelList.personModelList.length;

    for (int i = 0; i < personlist; i++) {
      if (PersonModelList.personModelList[i].personalHeadData!.hasPasTrip ==
          false) {
        if (PersonModelList
                .personModelList[i].personalHeadData?.refuseToTellAge ==
            false) {
          int age = int.parse(
              PersonModelList.personModelList[i].personalHeadData!.age.text);
          if (age >= 6) {
            TripModeList.tripModeList[0].person
                .add(PersonModelList.personModelList[i].personName.text);
            mainPersonList
                .add(PersonModelList.personModelList[i].personName.text);
            // TripModeList.tripModeList[0].mainPerson
            //     .add(PersonModelList.personModelList[i].personName.text);
            // notifyListeners();
          } else if ((age <= 6)) {
            // TripModeList.tripModeList[0].person
            //     .add(PersonModelList.personModelList[i].personName.text);
            // TripModeList.tripModeList[0].mainPerson
            //     .add(PersonModelList.personModelList[i].personName.text);
            mainPersonList
                .add(PersonModelList.personModelList[i].personName.text);
            // notifyListeners();
          }
        } else if (PersonModelList
                .personModelList[i].personalHeadData!.age.text !=
            '< 6') {
          TripModeList.tripModeList[0].person
              .add(PersonModelList.personModelList[i].personName.text);
          mainPersonList
              .add(PersonModelList.personModelList[i].personName.text);
          // TripModeList.tripModeList[0].mainPerson
          //     .add(PersonModelList.personModelList[i].personName.text);
          // notifyListeners();
        }
      }
    }

    list = TripModeList.tripModeList[0].person;

    print('list');
    print(list.toString());
    print('list2');
    print(mainPersonList.toString());

    notifyListeners();
  }

  ///
  addOwnerTrip(int i, String p) {
    List xc = TripModeList.tripModeList[i].friendPerson["friendPerson"] ?? [];
    TripModeList.tripModeList[i].friendPerson["friendPerson"] = [];

    for (int x = 0; x < mainPersonList.length; x++) {
      if (mainPersonList[x].toString() != p) {
        for (int f = 0; f < xc.length; f++) {
          if (xc[f] == mainPersonList[x]) {
            TripModeList.tripModeList[i].friendPerson["friendPerson"]
                .add({"value": mainPersonList[x], "isChick": true});
          } else {
            TripModeList.tripModeList[i].friendPerson["friendPerson"]
                .add({"value": mainPersonList[x], "isChick": false});
          }
        }
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

  ///isTravelAlone
  isTravelAlone(int index, ChangeBoxResponse r, BuildContext context) {
    debugPrint('chosenPerson');
    debugPrint(TripModeList.tripModeList[index].chosenPerson);
    if (TripModeList.tripModeList[index].chosenPerson.isNotEmpty) {
      if (r.val == "بمفردك") {
        TripModeList.tripModeList[index].isTravelAlone = false;
      } else if (r.val == "مع الأخرين" && r.check == true) {
        TripModeList.tripModeList[index].isTravelAlone = true;
        TripModeList.tripModeList[index].friendPerson["friendPerson"] = [];
        for (int x = 0;
            x < TripModeList.tripModeList[index].person.length;
            x++) {
          // debugPrint('mainPerson');
          // debugPrint(
          //     TripModeList.tripModeList[index].mainPerson.length.toString());
          // debugPrint(TripModeList.tripModeList[index].mainPerson[x].toString());
          // debugPrint('person');
          // debugPrint(TripModeList.tripModeList[index].person.length.toString());
          //
          // debugPrint(TripModeList.tripModeList[index].person[x].toString());

          if (TripModeList.tripModeList[index].person[x].toString() !=
              TripModeList.tripModeList[index].chosenPerson) {
            TripModeList.tripModeList[index].friendPerson["friendPerson"].add({
              "value": TripModeList.tripModeList[index].person[x],
              "isChick": false
            });
          }
        }
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

  ///Set-MainMode
  TextEditingController mainModeController = TextEditingController();

  setMainMode(String? p, int index) {
    TripModeList.tripModeList[index].travelWay!.mainMode = p.toString();
    if (TripModeList.tripModeList[index].travelWay!.mainMode == "أخر") {
      mainModeController.text = "أخر";
      TripModeList.tripModeList[index].travelWay!.mainMode =
          mainModeController.text;
    } else {
      TripModeList.tripModeList[index].travelWay!.mainMode = p;
      mainModeController.text =
          TripModeList.tripModeList[index].travelWay!.mainMode!;
    }
    // TripConditions().setIsCarDriver(index);
    notifyListeners();
  }

  bool checkIsCarDriver = false;

  ///Set-AccessMode
  TextEditingController acModeController = TextEditingController();

  setAccessMode(String? p, int index) {
    TripModeList.tripModeList[index].travelWay!.accessMode = p.toString();
    if (TripModeList.tripModeList[index].travelWay!.accessMode == "أخر") {
      acModeController.text = "أخر";
      TripModeList.tripModeList[index].travelWay!.accessMode =
          acModeController.text;
    } else {
      TripModeList.tripModeList[index].travelWay!.accessMode = p;
      acModeController.text =
          TripModeList.tripModeList[index].travelWay!.accessMode!;
    }
    // TripConditions().setIsCarDriver(index);

    notifyListeners();
  }

  ///Set-taxiTravelType
  taxiTravelType(int i, p) {
    var base = TripModeList.tripModeList[i].travelTypeModel;
    base.taxiTravelType = p.toString();

    if (base.taxiTravelType != "أخر") {
      base.taxiTravelType = p.toString();
      base.taxiTravelTypeOther.text = base.taxiTravelType!;
    } else {
      base.taxiTravelTypeOther.text = "أخر";
      base.taxiTravelType != base.taxiTravelTypeOther.text;
    }

    // PersonConditions().checkDrivingLicenceTypeOther(i);
    notifyListeners();
  }
}
