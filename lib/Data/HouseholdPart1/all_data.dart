import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/vechelis_data.dart';

import '../../Models/Vehicles_SurveyModel/vehicles_model.dart';
import '../../UI/Screens/Survey/components/q5.dart';
import '../../UI/Screens/person/person_model.dart';
import '../../UI/Screens/trips/components/adults_or_not.dart';
import '../../UI/Screens/trips/model/trip_model.dart';
import '../../UI/Screens/trips/model/trip_model_editing_controller.dart';

class PersonModelList {


  static List<PersonModel> personModelList = [
    PersonModel(
      addressMainOccuption: TextEditingController(),
      earlyAndLateFinish: TextEditingController(),
      earlyAndLateStart: TextEditingController(),
      startYourWork: TextEditingController(),
      endYourWork: TextEditingController(),
      geocode: TextEditingController(),
      nationality: "",
      educateAddress: TextEditingController(),
      isEmployee: "0",
      address: TextEditingController(),
      realtionShipOfTheHeadHouse: "",
      nationallityEditingController: TextEditingController(),
      gender: "male",
      checkAge: false,
      refuseToTellAge: false,
      needAge: TextEditingController(),
    )
  ];
}

class TripModeList {
  static List<TripModel> tripModeList = [
    TripModel(
      whereDidYouGo: "",
      purposeOfBeing: "",
      mainMode: "",
      accessMode: "",
        memberHouseHoldTravelPass: "",
        typeTravel: "",
        typeTaxi: "",
        locationPark: "",
        costTaxi: TextEditingController(),
        depart: TextEditingController(),
        destination: TextEditingController(),
        tripModel: TripModelEditingController(
            streetName: TextEditingController(),
            buildingName: TextEditingController(),
            streetNumber: TextEditingController(),
            zoneNumber: TextEditingController(),
            nearestLandMark: TextEditingController(),
            blockNearestTwoCrossStreets: TextEditingController(),
            area: TextEditingController()),
        type: false,
        typeAlone: false,
        travelAloneHouseHold: AdultsModel(
            adultsPlus18: TextEditingController(),
            adultsMin18: TextEditingController(),
            text: "Non Household persons"),
        travelAloneWithOther: AdultsModel(
            adultsPlus18: TextEditingController(),
            adultsMin18: TextEditingController(),
            text: "?If with other how many"),
        atWhatAddressDidYou: TripModelEditingController(
            streetName: TextEditingController(),
            buildingName: TextEditingController(),
            streetNumber: TextEditingController(),
            zoneNumber: TextEditingController(),
            nearestLandMark: TextEditingController(),
            blockNearestTwoCrossStreets: TextEditingController(),
            area: TextEditingController()),
        expectedDeparture: TextEditingController(),
        editingController3: EditingController3(
            peopleUnder18: TextEditingController(),
            totalNumber: TextEditingController(),
            peopleAdults18: TextEditingController()),
        typeTravelCondition: "0")
  ];
}

class VehModel {

  static EditingController3 editingController3=EditingController3(peopleUnder18: TextEditingController(),
      totalNumber:  TextEditingController(), peopleAdults18:  TextEditingController());
  static List<VecBodyType> vecCar = [];
  static List<VecBodyType> vecVan = [];
  static List<VecBodyType> largeCar=[];
  static List<VecBodyType> eScooter=[];
  static List<VecBodyType> pickUp=[];
  static List<VecBodyType> other=[];
  static String fuelTypeCode="";
  static String ownerShipCode="";
  static String parkThisCar="";
  static String nearestPublicTransporter="";



}