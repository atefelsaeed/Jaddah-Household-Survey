import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/editing_controler3.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Models/HHS_SurvyModels/survey_hhs.dart';
import '../../../Providers/survey_hhs.dart';
import 'actions/action_survey_screen.dart';

class EditingController {


  final TextEditingController yes = TextEditingController();

  final TextEditingController peopleAdults18 = TextEditingController();
  final TextEditingController peopleUnder18 = TextEditingController();
  List<TextEditingController> q6peopleAdults18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6peopleUnder18 = <TextEditingController>[
    TextEditingController()
  ];

  List<TextEditingController> q6totalNumberOfVec = <TextEditingController>[
    TextEditingController()
  ];

  EditingController3 editingController3Q81 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q82 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());

  EditingController3 editingController3Q83 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());



}
 c(EditingController editingController,BuildContext context) async {
   print('surveyPT.householdQuestions.hhsElectricCycles.adultsBikesNumber');
   SurveyPTProvider surveyPt =
   Provider.of<SurveyPTProvider>(context, listen: false);
   final validationService = Provider.of<ActionSurveyProvider>(
       context, listen: false);
   await surveyPt.getAllLocalData();
   print(surveyPt.surveyAllData!.first.householdQuestions.hhsNumberBedRooms.text
       .toString());
   print(HhsStatic.householdQuestions.hhsNumberBedRooms.text);
   /* HhsStatic.householdAddress.hhsPhone.text=surveyPt.surveyAllData!.first.householdQuestions.hhsDemolishedAreas.toString();
   HhsStatic.householdQuestions.hhsNumberBedRooms.text=surveyPt.surveyAllData!.first.householdQuestions.hhsNumberBedRooms.text.toString();
   HhsStatic.householdQuestions.hhsNumberFloors.text=surveyPt.surveyAllData!.first.householdQuestions.hhsNumberFloors.text.toString();
   HhsStatic.householdQuestions.hhsDwellingType=surveyPt.surveyAllData!.first.householdQuestions.hhsDwellingType.toString();
   HhsStatic.householdQuestions.hhsDemolishedAreas=surveyPt.surveyAllData!.first.householdQuestions.hhsDemolishedAreas.toString();
   HhsStatic.householdQuestions.hhsIsDwelling=surveyPt.surveyAllData!.first.householdQuestions.hhsIsDwelling.toString();
   HhsStatic.householdQuestions.hhsIsDwellingOther!.text=surveyPt.surveyAllData!.first.householdQuestions.hhsIsDwellingOther!.text.toString();
validationService.cc();*/


   HhsStatic.householdQuestions.hhsDwellingType =
       surveyPt.surveyAllData!.first.householdQuestions.hhsIsDwelling
           .toString(); //solve
   surveyPt.hhsNumberApartments.text =
       surveyPt.surveyAllData!.first.householdQuestions.hhsNumberApartments
           .toString();

   HhsStatic.householdQuestions.hhsNumberFloors.text =
       surveyPt.surveyAllData!.first.householdQuestions.hhsNumberFloors.text;

   HhsStatic.householdQuestions.hhsNumberBedRooms.text =
       surveyPt.surveyAllData!.first.householdQuestions.hhsNumberBedRooms.text;
   // ================ HHSQ10 ==============
   // surveyPt.hhsSeparateFamilies = HhsStatic.houseHold[0].totalNumberVehicles;


   HhsStatic.householdAddress.hhsPhone.text = surveyPt.hhsPhone.text;
   HhsStatic.householdQuestions.hhsIsDwelling =
       surveyPt.surveyAllData!.first.householdQuestions.hhsIsDwelling; //solve


   HhsStatic.householdQuestions.hhsNumberSeparateFamilies =
       surveyPt.surveyAllData!.first.householdQuestions
           .hhsNumberSeparateFamilies;
   //solve

   HhsStatic.householdQuestions.hhsNumberYearsInAddress =
       surveyPt.surveyAllData!.first.householdQuestions
           .hhsNumberYearsInAddress; //solve
   HhsStatic.householdAddress.hhsPhone =
       surveyPt.surveyAllData!.first.header.householdAddress.hhsPhone;
   print(surveyPt.surveyAllData!.first.householdQuestions
       .hhsNumberSeparateFamilies);
   for (int i = 1; i < QuestionsData
       .qh4[QuestionsData.qh4.keys.first]!
       .toList().length; i++) {
     if (int.parse(surveyPt.surveyAllData!.first.householdQuestions
         .hhsNumberSeparateFamilies.toString()) == i) {
       print(i);
       QuestionsData.qh4[QuestionsData.qh4.keys.first][i - 1]["isChick"] = true;
     }
   }
   HhsStatic.houseHold = [];
   editingController.q6peopleUnder18 = [];
   editingController.q6peopleAdults18 = [];
   editingController.q6totalNumberOfVec = [];
   for (int i = 0; i <
       surveyPt.surveyAllData!.first.hhsSeparateFamilies!.length; i++) {
     editingController.q6peopleUnder18.add(TextEditingController(
         text: surveyPt.surveyAllData!.first.hhsSeparateFamilies![i]
             .numberChildren.toString()));
     editingController.q6peopleAdults18.add(TextEditingController(
         text: surveyPt.surveyAllData!.first.hhsSeparateFamilies![i]
             .numberAdults.toString()));
     editingController.q6totalNumberOfVec.add(TextEditingController(
         text: surveyPt.surveyAllData!.first.hhsSeparateFamilies![i]
             .totalNumberVehicles.toString()));
     //  HhsStatic.houseHold.add(SeparateFamilies(TextEditingController(text:surveyPt.surveyAllData!.first.hhsSeparateFamilies[i].numberAdults ), TextEditingController(text: TextEditingController(text:surveyPt.surveyAllData!.first.hhsSeparateFamilies[i].numberChildren ), TextEditingController(text: surveyPt.surveyAllData!.first.hhsSeparateFamilies[i].numberChildren)))
   }
   editingController.peopleAdults18.text =
       surveyPt.surveyAllData!.first.householdQuestions.hhsNumberAdults
           .toString();
   editingController.peopleUnder18.text =
       surveyPt.surveyAllData!.first.householdQuestions.hhsNumberChildren
           .toString();
   for (int i = 1; i < QuestionsData
       .qh4[QuestionsData.qh4.keys.first]!
       .toList().length; i++) {
     if (int.parse(surveyPt.surveyAllData!.first.householdQuestions
         .hhsNumberSeparateFamilies.toString()) == i) {
       print(i);
       QuestionsData.qh4[QuestionsData.qh4.keys.first][i - 1]["isChick"] = true;
     }
   }

   for (int i = 1; i < QuestionsData
       .qh7[QuestionsData.qh7.keys.first]!
       .toList().length; i++) {
     if (surveyPt.surveyAllData!.first.householdQuestions
         .hhsNumberYearsInAddress.toString() ==
         QuestionsData.qh7[QuestionsData.qh7.keys.first][i]["value"]) {
       QuestionsData.qh7[QuestionsData.qh7.keys.first][i - 1]["isChick"] = true;
     }
   }
print("123");
   print(surveyPt.surveyAllData!.first.vehiclesData.nearestBusStop);
   for (int i = 1; i < VehiclesData.q3VecData
       [VehiclesData.q3VecData.keys.first]!
       .toList().length; i++) {
     if (surveyPt.surveyAllData!.first.vehiclesData.nearestBusStop
          ==
         VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i]["value"]) {
       print(VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i]);
       print(i);
       VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i-1]["isChick"] = true;
       print("112355");
       print(  VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i-1]["isChick"]);
       VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first][i-1]["value"];
     }
   }

   print("object");
   print(surveyPt.surveyAllData!.first.householdQuestions.hhsDemolishedAreas);
   print(surveyPt.surveyAllData!.first.householdQuestions.hhsIsDemolishedAreas);

   if (surveyPt.surveyAllData!
       .first.householdQuestions.hhsDemolishedAreas
       .toString()
       .isNotEmpty) { //  ==QuestionsData.qh7_2[QuestionsData.qh7_2.keys.first][i]["value"]){
     QuestionsData.qh7_2[QuestionsData.qh7_2.keys.first][0]["isChick"] = true;
     HhsStatic.householdQuestions.hhsIsDemolishedAreas=true;
     HhsStatic.householdQuestions.hhsDemolishedAreas=surveyPt.surveyAllData!.first.householdQuestions.hhsDemolishedAreas
         .toString();
   }

   editingController.editingController3Q81=EditingController3(peopleUnder18:TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsPedalCycles.childrenBikesNumber), totalNumber: TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsPedalCycles.totalBikesNumber), peopleAdults18: TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsPedalCycles.adultsBikesNumber));
   editingController.editingController3Q82=EditingController3(peopleUnder18:TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsElectricScooter.childrenBikesNumber), totalNumber: TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsElectricScooter.totalBikesNumber), peopleAdults18: TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsElectricScooter.adultsBikesNumber));
   editingController.editingController3Q83=EditingController3(peopleUnder18:TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsElectricCycles.childrenBikesNumber), totalNumber: TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsElectricCycles.totalBikesNumber), peopleAdults18: TextEditingController(text: surveyPt.surveyAllData!.first.householdQuestions.hhsElectricCycles.adultsBikesNumber));

HhsStatic.householdQuestions.hhsTotalIncome=surveyPt.surveyAllData!.first.householdQuestions.hhsTotalIncome;
  validationService.cc();
   // HhsStatic.houseHold.first.numberAdults=surveyPt.surveyAllData!.first.hhsSeparateFamilies!.first.numberAdults.toString();
   //HhsStatic.householdQuestions.hhsNumberSeparateFamilies=surveyPt.surveyAllData!.first.hhsSeparateFamilies!.length.toString();
 ///editingController.peopleAdults18.text =surveyPt.surveyAllData!.;
  /* surveyPt.hhsNumberChildren =
       editingController.peopleUnder18.text; //solve
   surveyPt.hhsSeparateFamilies = HhsStatic.houseHold;
   surveyPt.hhsTotalIncome = HhsStatic.householdQuestions.hhsTotalIncome;
   surveyPt.hhsPCChildrenBikesNumber =
       editingController.editingController3Q81.peopleUnder18.text;
   surveyPt.hhsPCTotalBikesNumber =
       editingController.editingController3Q81.totalNumber.text;
   surveyPt.hhsPCAdultsBikesNumber =
       editingController.editingController3Q81.peopleAdults18.text;
   HhsStatic.peopleUnder18 = editingController.peopleUnder18.text;
   HhsStatic.peopleAdults18 = editingController.peopleAdults18.text;
   surveyPt.hhsECChildrenBikesNumber =
       editingController.editingController3Q82.peopleUnder18.text;
   surveyPt.hhsECTotalBikesNumber =
       editingController.editingController3Q82.totalNumber.text;
   surveyPt.hhsECAdultsBikesNumber =
       editingController.editingController3Q82.peopleAdults18.text;
   surveyPt.hhsESChildrenBikesNumber =
       editingController.editingController3Q83.peopleUnder18.text;
   surveyPt.hhsESTotalBikesNumber =
       editingController.editingController3Q83.totalNumber.text;
   surveyPt.hhsESAdultsBikesNumber =
       editingController.editingController3Q83.peopleAdults18.text;
   surveyPt.hhsDemolishedAreas = editingController.yes.text;
   surveyPt.headerDistrictName = '';
   surveyPt.headerZoneNumber = '';
   print(HhsStatic.householdQuestions.hhsDwellingType);*/
}