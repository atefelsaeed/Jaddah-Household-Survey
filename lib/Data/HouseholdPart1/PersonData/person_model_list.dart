import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/personal_question.dart';

import '../../../Models/Person_SurveyModel/person_model.dart';

class PersonModelList {
  static List<PersonModel> personModelList = [
    PersonModel(
      personName: TextEditingController(),
      //==personalHeadData==
      personalHeadData: PersonalHeadData(
        age: TextEditingController(),
        nationality: TextEditingController(),
        nationalityType: '',
        gender: '',
        checkAge: false,
        refuseToTellAge: false,
        relationshipHeadHHS: '',
      ),
      //==personalQuestion==
      personalQuestion: PersonalQuestion(
        mainOccupationType: '',
        asPassenger: '',
        availablePersonalCar: '',
        drivingLicenceType: '',
        haveBusPass: '',
        haveDisabilityTransportMobility: '',
        haveCarSharing: false,
        educationAddress: EducationAddress(
          fullAddress: TextEditingController(),
          geocodes: TextEditingController(),
        ),
      ),
      //==occupationModel==
      occupationModel: OccupationModel(
        earliestTimeFinishingWork: TextEditingController(),
        earliestTimeStartingWork: TextEditingController(),
        endingWoke: TextEditingController(),
        startingWoke: TextEditingController(),
        address: TextEditingController(),
        geoCodes: TextEditingController(),
        mainOccupationAddress: TextEditingController(),
        bestWorkspaceLocation: '',
        bikeWorkDays: 0,
        commuteWorkDays: 0,
        flexibleWorkingHours: '',
        isEmployee: '',
        isWorkFromHome: false,
        numberWorkFromHome: 0,
        occupationLevelSector: '',
        occupationSector: '',
      ),
    ),
  ];
}
