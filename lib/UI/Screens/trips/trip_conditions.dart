import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/save_finish.dart';
import 'package:jaddah_household_survey/UI/Widgets/show_dialog_error.dart';
import 'package:provider/provider.dart';

class TripConditions {
  void showError(context, Widget widget) => showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return widget;
      });

  ///
  bool checkIsCarDriver(int i, context) {
    var bas = TripModeList.tripModeList[i].travelTypeModel;
    if (((TripModeList.tripModeList[i].travelWay!.mainMode == 'سائق سيارة') ||
            (TripModeList.tripModeList[i].travelWay!.accessMode ==
                'سائق سيارة')) &&
        (bas.travelType != 'سيارة')) {
      showError(
          context,
          ShowErrorDialog(
              title: ' بماذا ذهبت ؟ رحلة ${i + 1}',
              content:
                  'في سؤال 6 "الوضع الرئيسي" او "وضع الوصول" اذا كان الاختيار سائق سيارة يجب أن يكون الجواب في سؤال 8 بماذا ذهبت ؟ الجواب "سيارة"'));
      return false;
    } else {
      return true;
    }
  }

  ///
  bool checkIsTravelAloneAdultsNumber1(int i, context) {
    var bas = TripModeList.tripModeList[i]; //travelWithOtherModel
    int adultsNumber = bas.travelWithOtherModel!.adultsNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelWithOtherModel!.adultsNumber.text);
    int adultsNumber2 = bas.travelAloneHouseHold!.adultsNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelAloneHouseHold!.adultsNumber.text);

    if ((adultsNumber2 <= adultsNumber) && bas.isTravelAlone == true) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content:
              "''  عدد البالغين اكبر من او يساوي عدد البالغين في سؤال ( أي من افراد الاسرة ذهب معك ؟ ) عدد المرافقين يجب أن يكون اكبر من أو يساوي المرافقين من الاسرة''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///
  bool checkIsTravelAloneChildrenNumber1(int i, context) {
    var bas = TripModeList.tripModeList[i]; //travelWithOtherModel
    int adultsNumber = bas.travelWithOtherModel!.childrenNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelWithOtherModel!.childrenNumber.text);
    int adultsNumber2 = bas.travelAloneHouseHold!.childrenNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelAloneHouseHold!.childrenNumber.text);

    if ((adultsNumber2 <= adultsNumber) && bas.isTravelAlone == true) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content:
              "''  عدد الأطفال اكبر من او يساوي عدد الأطفال في سؤال ( أي من افراد الاسرة ذهب معك ؟ ) عدد المرافقين يجب أن يكون اكبر من أو يساوي المرافقين من الاسرة''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///

  bool checkIsTravelAloneAdultsNumberQ4HHS(int i, context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);

    var bas = TripModeList.tripModeList[i];

    int adultsNumber2 = bas.travelAloneHouseHold!.adultsNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelAloneHouseHold!.adultsNumber.text);

    int numAdults = 0;
    int length = surveyPt.hhsSeparateFamilies.length;

    for (int i = 0; i < length; i++) {
      numAdults =
          int.parse(surveyPt.hhsSeparateFamilies[i].numberAdults!) + numAdults;
    }
    if (adultsNumber2 >= numAdults) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content: "''"
              "اذا كان الاختيار "
              "مع آخرين"
              " فأن سؤال ( أي من افراد الاسرة ذهب معك ؟ )"
              " يكون عدد الأطفال لا يزيد من عدد الأطفال في صفحة 1 سؤال 4 "
              "عدد الأطفال "
              ""
              "''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///
  bool checkIsTravelAloneChildrenNumberQ4HHS(int i, context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);

    var bas = TripModeList.tripModeList[i];

    int adultsNumber2 = bas.travelAloneHouseHold!.childrenNumber.text.isEmpty
        ? 0
        : int.parse(bas.travelAloneHouseHold!.childrenNumber.text);

    int numAdults = 0;
    int length = surveyPt.hhsSeparateFamilies.length;

    for (int i = 0; i < length; i++) {
      numAdults = int.parse(surveyPt.hhsSeparateFamilies[i].numberChildren!) +
          numAdults;
    }
    if (adultsNumber2 >= numAdults) {
      showError(
        context,
        ShowErrorDialog(
          title: ' هل ذهبت بمفردك ام مع آخرين ؟ رحلة ${i + 1}',
          content: "''"
              "اذا كان الاختيار "
              "مع آخرين"
              " فأن سؤال ( أي من افراد الاسرة ذهب معك ؟ )"
              " يكون عدد البالغين لا يزيد من عدد الأطفال في صفحة 1 سؤال 4 "
              "عدد البالغين "
              ""
              "''",
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  ///
  bool personWithoutTrip({
    required int i,
  required BuildContext context,
    required Function function,
  }) {
    var bas = TripModeList.tripModeList[i];
    List tripPersons = bas.person;
    List tripOwner = [];
    tripOwner.add(bas.chosenPerson);
    List<String> personsWithoutTrip = [];
    int tripLength = tripPersons.length;
    for (int e = 0; e < tripLength; e++) {
      if (tripPersons[e] != tripOwner[i]) {
        personsWithoutTrip.add(tripPersons[e]);
      }
    }
    SaveAndFinish.saveAndFinish(context, personsWithoutTrip, function);

    // if (personsWithoutTrip.isNotEmpty) {
    //   SaveAndFinish.saveAndFinish(context, personsWithoutTrip, function);
    //   return false;
    // } else {
    //   // return true;
    // }
    return true;
  }
}
