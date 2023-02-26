import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Providers/survey_hhs.dart';
import '../Survey/actions/action_survey_screen.dart';

class ResetVechilesValues {
  static resetVechValues(context) async {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    final validationService =
        Provider.of<ActionSurveyProvider>(context, listen: false);
     await surveyPt.getAllLocalData();

    // for (int i = 1; i <= VehiclesData.vecModel.length; i++) {
    //   VehiclesData.vecModel[i].number = surveyPt
    //       .surveyAllData!.first.vehiclesBodyType![i].vehicleTypeQuantity!;
    //   if (surveyPt
    //           .surveyAllData!.first.vehiclesBodyType![i].vehicleTypeQuantity! >
    //       0) {
    //     VehiclesData.vecModel[i].isChosen = true;
    //     VehiclesData.vecModel[i].textEditingController.text = surveyPt
    //         .surveyAllData!.first.vehiclesBodyType![i].vehicleTypeQuantity
    //         .toString();
    //   }
    // }

    ///vecCar
    VehModel.vecCar =
        surveyPt.surveyAllData!.first.vehiclesBodyType![0].vehicleTypeDetails!;
    var vecCarLength = VehModel.vecCar.length;

    for (int i = 0; i <= vecCarLength; i++) {
      if (i < vecCarLength) {
        VehModel.vecCar[i].vehicleFuelType.text = surveyPt.surveyAllData!.first
            .vehiclesBodyType![0].vehicleTypeDetails![i].vehicleFuelType.text;

        VehModel.vecCar[i].vehicleOwnership.text = surveyPt.surveyAllData!.first
            .vehiclesBodyType![0].vehicleTypeDetails![i].vehicleOwnership.text;
        VehModel.vecCar[i].vehicleParking.text = surveyPt.surveyAllData!.first
            .vehiclesBodyType![0].vehicleTypeDetails![i].vehicleParking.text;
      }
    }

    ///vecVan
    VehModel.vecVan =
        surveyPt.surveyAllData!.first.vehiclesBodyType![1].vehicleTypeDetails!;
    for (int i = 0; i <= VehModel.vecVan.length; i++) {
      VehModel.vecVan[i].vehicleFuelType.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![1].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecVan[i].vehicleOwnership.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![1].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecVan[i].vehicleParking.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![1].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///largeCar
    VehModel.largeCar =
        surveyPt.surveyAllData!.first.vehiclesBodyType![2].vehicleTypeDetails!;
    for (int i = 0; i <= VehModel.largeCar.length; i++) {
      VehModel.largeCar[i].vehicleFuelType.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![2].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.largeCar[i].vehicleOwnership.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![2].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.largeCar[i].vehicleParking.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![2].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///eScooter
    VehModel.eScooter =
        surveyPt.surveyAllData!.first.vehiclesBodyType![3].vehicleTypeDetails!;
    for (int i = 0; i <= VehModel.eScooter.length; i++) {
      VehModel.eScooter[i].vehicleFuelType.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![3].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.eScooter[i].vehicleOwnership.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![3].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.eScooter[i].vehicleParking.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![3].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///pickUp
    VehModel.pickUp =
        surveyPt.surveyAllData!.first.vehiclesBodyType![4].vehicleTypeDetails!;
    for (int i = 0; i <= VehModel.pickUp.length; i++) {
      VehModel.pickUp[i].vehicleFuelType.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![4].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.pickUp[i].vehicleOwnership.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![4].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.pickUp[i].vehicleParking.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![4].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///bicycle
    VehModel.bicycle =
        surveyPt.surveyAllData!.first.vehiclesBodyType![5].vehicleTypeDetails!;
    for (int i = 0; i <= VehModel.bicycle.length; i++) {
      VehModel.bicycle[i].vehicleOwnership.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![5].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.bicycle[i].vehicleParking.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![5].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecWanet
    VehModel.vecWanet =
        surveyPt.surveyAllData!.first.vehiclesBodyType![6].vehicleTypeDetails!;
    for (int i = 0; i <= VehModel.vecWanet.length; i++) {
      VehModel.vecWanet[i].vehicleFuelType.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![6].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecWanet[i].vehicleOwnership.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![6].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecWanet[i].vehicleParking.text = surveyPt.surveyAllData!.first
          .vehiclesBodyType![6].vehicleTypeDetails![i].vehicleParking.text;
    }
  }
}
