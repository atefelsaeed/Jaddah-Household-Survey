import 'package:jaddah_household_survey/Helper/validator.dart';

import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../PersonData/person_model_list.dart';

class CheckPersonValidation {
  static validatePerson(context) {
    for (var element in PersonModelList.personModelList) {
      if (element.personalHeadData!.age.text == '') {
        return Validator.showSnack(context, " يجب إخيار ! الفئة العمرية؟ ");
      } else if (element.personalHeadData!.nationalityType == '') {
        return Validator.showSnack(context, " يجب إخيار !  الجنسية ");
      } else if (element.personalHeadData!.gender == '') {
        return Validator.showSnack(context, " يجب إخيار ! الجنس ");
      } else if (element.personalHeadData!.relationshipHeadHHS == '') {
        return Validator.showSnack(
            context, " يجب إخيار ! القرابة برب الاسرة؟ ");
      } else  if (HhsStatic.householdAddress.hhsHavePastTrip.text == "") {
        return Validator.showSnack(
            context, " يجب إخيار! هل قمت برحلة فى الأيام السابقة ");
      } else{
       return true;
      }
    }
  }
}
