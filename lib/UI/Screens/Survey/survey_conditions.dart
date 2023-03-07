import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/editing_controller.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Providers/survey_hhs.dart';

class SurveyCondition {


  bool conditionHHSQ5NumAdults(EditingController editingController,context) {
    int houseHoldLength = editingController.peopleAdults18.text.isEmpty
        ? 0
        : int.parse(editingController.peopleAdults18.text);
    print('houseHoldLength');
    print(houseHoldLength);
    int numAdults = 0;
    for (int i = 0; i < editingController.q6peopleAdults18.length; i++) {
      print("!222");
print(editingController.q6peopleAdults18[i].text);
      numAdults =
          int.parse(editingController.q6peopleAdults18[i].text) + numAdults;
    }
    print(numAdults);
    print(editingController.peopleAdults18.text);
    if (houseHoldLength> numAdults) {
      Validator.showSnack(context,
          'لا يزيد العدد عن حقل البالغين في سؤال 5');
      return false;
    } else {
      return true;
    }
  }
  bool conditionHHSQ5NumUnder18(EditingController editingController,context) {
    int houseHoldLength = editingController.peopleUnder18.text.isEmpty
        ? 0
        : int.parse(editingController.peopleUnder18.text);
    print('houseHoldLength');
    print(houseHoldLength);
    int numAdults = 0;
    for (int i = 0; i < editingController.q6peopleUnder18.length; i++) {

      numAdults =
          int.parse(editingController.q6peopleUnder18[i].text) + numAdults;
    }
    print(numAdults);
    print(editingController.peopleUnder18.text);
    if (houseHoldLength> numAdults) {
      Validator.showSnack(context,
          'بجب ان لا يزيد عدد الأطفال عن عدد الأطفال في سؤال 4..!');
      return false;
    } else {
      return true;
    }
  }
  bool numberParcelsDeliveries(context) {
    int numberParcels = VehModel.vehiclesModel.numberParcels.text.isEmpty
        ? 0
        : int.parse(VehModel.vehiclesModel.numberParcels.text);

    int numberFood = VehModel.vehiclesModel.numberFood.text.isEmpty
        ? 0
        : int.parse(VehModel.vehiclesModel.numberFood.text);

    int numberGrocery = VehModel.vehiclesModel.numberGrocery.text.isEmpty
        ? 0
        : int.parse(VehModel.vehiclesModel.numberGrocery.text);

    int numberOtherParcels = VehModel.vehiclesModel.numberParcels.text.isEmpty
        ? 0
        : int.parse(VehModel.vehiclesModel.numberOtherParcels.text);

    int numberParcelsDeliveries =
        VehModel.vehiclesModel.numberParcelsDeliveries.text.isEmpty
            ? 0
            : int.parse(VehModel.vehiclesModel.numberParcelsDeliveries.text);

    int total = numberParcels + numberGrocery + numberFood + numberOtherParcels;

    if (numberParcelsDeliveries != total) {
      Validator.showSnack(context,
          'عدد الطلبات في الحقول التفصيلية يجب أن يساوي عدد الطلبات المنزلية..!');
      return false;
    } else {
      return true;
    }
  }

  ///validateHHSQ81
  bool validateHHSQ81(context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    int peopleAdults18 = surveyPt.hhsPCAdultsBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsPCAdultsBikesNumber);
    int peopleUnder18 = surveyPt.hhsPCChildrenBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsPCChildrenBikesNumber);
    int totalNumber = surveyPt.hhsPCTotalBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsPCTotalBikesNumber);
    int total = peopleUnder18 + peopleAdults18;
    debugPrint('validateHHSQ81');
    debugPrint(totalNumber.toString());
    debugPrint(total.toString());
    if (totalNumber != total) {
      Validator.showSnack(context,
          'عدد الدراجات الهوائية !! عدد الدرجات للاطفال + عدد الدراجات للبالغين يجب ان يساوى اجمالي عدد الدراجات لجميع انواع الدراجات..!');
      return false;
    } else {
      return true;
    }
  }

  ///validateHHSQ82
  bool validateHHSQ82(context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);

    int peopleAdults18 = surveyPt.hhsECAdultsBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsECAdultsBikesNumber);
    int peopleUnder18 = surveyPt.hhsECChildrenBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsECChildrenBikesNumber);
    int totalNumber = surveyPt.hhsECTotalBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsECTotalBikesNumber);
    int total = peopleUnder18 + peopleAdults18;
    debugPrint('validateHHSQ82');
    debugPrint(totalNumber.toString());
    debugPrint(total.toString());
    if (totalNumber != total) {
      Validator.showSnack(context,
          'عدد الدراجات النارية !! عدد الدرجات للاطفال + عدد الدراجات للبالغين يجب ان يساوى اجمالي عدد الدراجات لجميع انواع الدراجات..!');
      return false;
    } else {
      return true;
    }
  }

  ///validateHHSQ83
  bool validateHHSQ83(context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    int peopleAdults18 = surveyPt.hhsESAdultsBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsESAdultsBikesNumber);
    int peopleUnder18 = surveyPt.hhsESChildrenBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsESChildrenBikesNumber);
    int totalNumber = surveyPt.hhsESTotalBikesNumber.isEmpty
        ? 0
        : int.parse(surveyPt.hhsESTotalBikesNumber);
    int total = peopleUnder18 + peopleAdults18;
    debugPrint('validateHHSQ83');
    debugPrint(totalNumber.toString());
    debugPrint(total.toString());
    if (totalNumber != total) {
      Validator.showSnack(context,
          'عدد الدراجات الإلكترونية(إسكوتر) !! عدد الدرجات للاطفال + عدد الدراجات للبالغين يجب ان يساوى اجمالي عدد الدراجات لجميع انواع الدراجات..!');
      return false;
    } else {
      return true;
    }
  }
}
