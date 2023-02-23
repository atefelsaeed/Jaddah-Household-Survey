import 'package:provider/provider.dart';

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

    ///
    VehModel.vecCar =
        surveyPt.surveyAllData!.first.vehiclesBodyType![0].vehicleTypeDetails!;
    VehModel.vecVan =
        surveyPt.surveyAllData!.first.vehiclesBodyType![1].vehicleTypeDetails!;
    VehModel.largeCar =
        surveyPt.surveyAllData!.first.vehiclesBodyType![2].vehicleTypeDetails!;
    VehModel.eScooter =
        surveyPt.surveyAllData!.first.vehiclesBodyType![3].vehicleTypeDetails!;
    VehModel.pickUp =
        surveyPt.surveyAllData!.first.vehiclesBodyType![4].vehicleTypeDetails!;
    VehModel.bicycle =
        surveyPt.surveyAllData!.first.vehiclesBodyType![5].vehicleTypeDetails!;
    VehModel.vecWanet =
        surveyPt.surveyAllData!.first.vehiclesBodyType![6].vehicleTypeDetails!;
  }
}
