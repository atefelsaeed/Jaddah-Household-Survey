import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/hhs_models.dart';

import '../VechelisData/veh_model.dart';

class EmptyHHS {
  //==========HHS===================
  static emptyHSS() {
    HhsStatic.houseHold = [];
    HhsStatic.hhsElectricScooter = BikesType('', '', '');
    HhsStatic.hhsElectricCycles == BikesType('', '', '');
    HhsStatic.hhsPedalCycles == BikesType('', '', '');
    HhsStatic.householdQuestions = HouseholdQuestions(
      hhsPedalCycles: BikesType("", "", ""),
      hhsDwellingTypeOther: TextEditingController(),
      hhsIsDwellingOther: TextEditingController(),
      hhsElectricCycles: BikesType("", "", ""),
      hhsTotalIncome: '',
      hhsElectricScooter: BikesType("", "", ""),
      hhsNumberSeparateFamilies: "",
      hhsNumberYearsInAddress: "",
    );
    HhsStatic.householdQuestions.hhsNumberSeparateFamilies = '';
    HhsStatic.householdQuestions.hhsNumberYearsInAddress = '';
    HhsStatic.householdQuestions.hhsDwellingTypeOther!.text = '';
    HhsStatic.householdQuestions.hhsIsDwellingOther!.text = '';
    HhsStatic.householdAddress =
        HouseholdAddress(hhsPhone: "", hhsAddressLong: "", hhsAddressLat: "");
    VehModel.editingController3.totalNumber.text = "";
    VehModel.nearestPublicTransporter = '';
  }
}
