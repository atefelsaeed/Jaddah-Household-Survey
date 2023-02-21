import 'package:jaddah_household_survey/Helper/validator.dart';

import '../PersonData/person_model_list.dart';

class CheckPersonValidation {
  static validatePerson(context) {
    for (var element in PersonModelList.personModelList) {
      if (element.personalHeadData!.gender == '' ||
          element.personalHeadData!.gender == null) {
        return Validator.showSnack(context, " يجب إخيار !نوع الجنس ");
      } else if (element.personalHeadData!.relationshipHeadHHS!.isEmpty ||
          element.personalHeadData!.relationshipHeadHHS == null) {
        return Validator.showSnack(
            context, " يجب إخيار ! القرابة برب الاسرة؟ ");
      } else if (element.personalHeadData!.age.text == '') {
        return Validator.showSnack(context, " يجب إخيار ! الفئة العمرية؟ ");
      } else if (element.personalHeadData!.hhsHavePastTrip.text.isEmpty ||
          element.personalHeadData!.hhsHavePastTrip.text == "") {
        return Validator.showSnack(
            context, " يجب إخيار! هل قمت برحلة فى الأيام السابقة ");
      } else if (element.personalHeadData!.nationalityType == '') {
        return Validator.showSnack(context, " يجب إخيار !  الجنسية ");
      } else if (element.personalQuestion!.mainOccupationType!.isEmpty ||
          element.personalQuestion!.mainOccupationType == null) {
        return Validator.showSnack(context, " يجب إخيار! الوظيفة الأساسية");
      } else if (element
              .personalQuestion!.haveDisabilityTransportMobility!.isEmpty ||
          element.personalQuestion!.haveDisabilityTransportMobility == null) {
        return Validator.showSnack(context,
            " يجب إخيار! هل لديك أي إعاقة / احتياجات خاصة لحركة النقل؟");
      } else {
        return true;
      }
    }
  }
}
