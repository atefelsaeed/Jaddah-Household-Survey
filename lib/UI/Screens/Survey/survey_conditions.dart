import 'package:jaddah_household_survey/Helper/validator.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/editing_controller.dart';

import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';

class SurveyCondition {
  EditingController editingController = EditingController();

  bool conditionHHSQ5NumAdults(int value) {
    int houseHoldLength = editingController.q6peopleAdults18.length;
    print('houseHoldLength');
    print(houseHoldLength);
    int numAdults = 0;
    for (int i = 0; i < houseHoldLength; i++) {
      print(editingController.q6peopleAdults18[i].text);
      numAdults =
          int.parse(editingController.q6peopleAdults18[i].text) + numAdults;
    }
    print(numAdults);
    print(value);
    if (value > numAdults) {
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

    if (numberParcelsDeliveries > total) {
      Validator.showSnack(context,
          'عدد الطلبات في الحقول التفصيلية يجب أن يساوي عدد الطلبات المنزلية..!');
      return false;
    } else {
      return true;
    }
  }
}
