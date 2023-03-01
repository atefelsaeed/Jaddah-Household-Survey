import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Providers/user_surveys.dart';

class ResetVechilesValues {
  static resetVechValues(context) async {
    UserSurveysProvider surveyPt =
        Provider.of<UserSurveysProvider>(context, listen: false);



    ///vecCar
    VehModel.vecCar =
        surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails!;//vehiclesData.    vehiclesBodyType![0].vehicleTypeDetails!;
    var vecCarLength = VehModel.vecCar.length;

    for (int i = 0; i < vecCarLength; i++) {
      if (i < vecCarLength) {
        VehModel.vecCar[i].vehicleFuelType.text =    surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails![i].vehicleFuelType.text;

        VehModel.vecCar[i].vehicleOwnership.text =    surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails![i].vehicleOwnership.text;
        VehModel.vecCar[i].vehicleParking.text =   surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails![i].vehicleParking.text;
      }
    }

    ///vecVan
    VehModel.vecVan =
    surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails!;
    for (int i = 0; i < VehModel.vecVan.length; i++) {
      VehModel.vecVan[i].vehicleFuelType.text =     surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecVan[i].vehicleOwnership.text =  surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecVan[i].vehicleParking.text = surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///largeCar
    VehModel.largeCar =
    surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails!;
    for (int i = 0; i < VehModel.largeCar.length; i++) {
      VehModel.largeCar[i].vehicleFuelType.text = surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.largeCar[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.largeCar[i].vehicleParking.text =surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///eScooter
    VehModel.eScooter =
    surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails!;
    for (int i = 0; i < VehModel.eScooter.length; i++) {
      VehModel.eScooter[i].vehicleFuelType.text = surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.eScooter[i].vehicleOwnership.text =  surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.eScooter[i].vehicleParking.text = surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///pickUp
    VehModel.pickUp =
    surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails!;
    for (int i = 0; i < VehModel.pickUp.length; i++) {
      VehModel.pickUp[i].vehicleFuelType.text =  surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.pickUp[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.pickUp[i].vehicleParking.text =  surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///bicycle
    VehModel.bicycle =
    surveyPt.surveyPT.vehiclesBodyType![5].vehicleTypeDetails!;
    for (int i = 0; i < VehModel.bicycle.length; i++) {
      VehModel.bicycle[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![5].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.bicycle[i].vehicleParking.text = surveyPt.surveyPT.vehiclesBodyType![5].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecWanet
    VehModel.vecWanet =
    surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails!;
    for (int i = 0; i < VehModel.vecWanet.length; i++) {
      VehModel.vecWanet[i].vehicleFuelType.text = surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecWanet[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecWanet[i].vehicleParking.text =surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails![i].vehicleParking.text;
    }
  }
}
