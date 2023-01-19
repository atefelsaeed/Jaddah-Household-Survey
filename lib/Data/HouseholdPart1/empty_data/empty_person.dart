import '../PersonData/person_model_list.dart';

class EmptyPerson{
  static emptyPerson(){
    for (var element in PersonModelList.personModelList) {
      element.personalHeadData!.age.text = '';
      element.personalHeadData!.nationality.text = '';
      element.personalHeadData!.nationalityType = '';
      element.personalHeadData!.relationshipHeadHHS = '';
      element.personalHeadData!.gender = '';
      element.personalQuestion!.mainOccupationType = '';
      element.personalQuestion!.haveDisabilityTransportMobility = '';
      element.personalQuestion!.haveBusPass = '';
      element.personalQuestion!.drivingLicenceType = '';
      element.personalQuestion!.availablePersonalCar = '';
      element.personalQuestion!.haveCarSharing = false;
      element.occupationModel!.occupationSector = '';
      element.occupationModel!.isEmployee = '';
      element.occupationModel!.occupationLevelSector = '';
      element.occupationModel!.bestWorkspaceLocation = '';
      element.occupationModel!.flexibleWorkingHours = '';
      element.occupationModel!.mainOccupationAddress.text = '';
      element.occupationModel!.earliestTimeFinishingWork.text = '';
    }
  }
}