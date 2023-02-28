import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/editing_controller.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Models/HHS_SurvyModels/survey_hhs.dart';
import '../widgets/list_view_check_box_orange.dart';

class ActionSurveyProvider extends ChangeNotifier {
  q4(
      ChangeBoxResponse r,
      List<TextEditingController> q6totalNumberOfVec,
      List<TextEditingController> q6peopleUnder18,
      List<TextEditingController> q6peopleAdults18) {
    if (r.check == true) {
      HhsStatic.householdQuestions.hhsNumberSeparateFamilies = r.val;

      while (int.parse(r.val) < q6totalNumberOfVec.length) {
        q6peopleAdults18.removeLast();
        q6peopleUnder18.removeLast();
        q6totalNumberOfVec.removeLast();
      }
    } else {
      q6peopleAdults18 = [TextEditingController()];
      q6peopleUnder18 = [TextEditingController()];
      q6totalNumberOfVec = [TextEditingController()];

      HhsStatic.householdQuestions.hhsNumberSeparateFamilies = "1";
    }
  }

  resetHHSValues(editingController, context,int id) async {
    print(id);
    print(id);
    print(id);
    await c(editingController, context,id);
    notifyListeners();
  }

  nearestTransporter(ChangeBoxResponse r) {
    VehModel.nearestPublicTransporter = r.val.toString();
    notifyListeners();

    print("d");
  }

  cc() {
    notifyListeners();
  }

  q7(ChangeBoxResponse r) {
    HhsStatic.householdQuestions.hhsNumberYearsInAddress = r.val;
  }

  q72(ChangeBoxResponse r, TextEditingController yes) {
    if (r.val == "نعم" && r.check == true) {
      HhsStatic.householdQuestions.hhsIsDemolishedAreas = true;
      yes.text = '';
    } else {
      HhsStatic.householdQuestions.hhsIsDemolishedAreas = false;
      yes.text = 'لا';
    }
    notifyListeners();
  }

  qh9(String p) {
    HhsStatic.householdQuestions.hhsTotalIncome = p;
  }

  qDArea(EditingController editingController, String p) {
    HhsStatic.householdQuestions.hhsDemolishedAreas = p;
    p == "أخر"
        ? editingController.yes.text = ""
        : editingController.yes.text =
    HhsStatic.householdQuestions.hhsDemolishedAreas!;
    notifyListeners();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
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
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  HHSQ1(String p) {
    HhsStatic.householdQuestions.hhsDwellingType = p;
    notifyListeners();
  }

  HHSQ2(String p) {
    HhsStatic.householdQuestions.hhsIsDwelling = p;
    notifyListeners();
  }

  listQ7(List<dynamic> question, index, chosenIndex, value) {
    question[chosenIndex]["isChick"] = false;
    chosenIndex = index;
    question[index]["isChick"] = value;
    notifyListeners();
  }

  resetValueQ9(List<SurveyPT> list) async {
    for (int i = 0;
    i <
        VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first]!
            .toList()
            .length;
    i++) {
      if (list.first.vehiclesData.nearestBusStop ==
          VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i]
          ["value"]) {
        VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i]
        ["isChick"] = true;
      }
    }
    notifyListeners();
  }
}
