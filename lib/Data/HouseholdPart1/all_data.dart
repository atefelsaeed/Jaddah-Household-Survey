import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/vechelis_data.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/personal_question.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/start_beginning_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/travel_type_model.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/travel_with_other_model.dart';

import '../../Models/Person_SurveyModel/person_model.dart';
import '../../Models/Trips_SurveyModel/trips_model.dart';
import '../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../Models/Vehicles_SurveyModel/vehicles_model.dart';
import '../../UI/Screens/Survey/components/q5.dart';
import '../../UI/Screens/person/person_model.dart';
import '../../UI/Screens/trips/components/adults_or_not.dart';
import '../../UI/Screens/trips/model/trip_model.dart';
import '../../UI/Screens/trips/model/trip_model_editing_controller.dart';

class PersonModelList {
  static List<PersonModel> personModelList = [
    // PersonModel(
    //   addressMainOccuption: TextEditingController(),
    //   earlyAndLateFinish: TextEditingController(),
    //   earlyAndLateStart: TextEditingController(),
    //   startYourWork: TextEditingController(),
    //   endYourWork: TextEditingController(),
    //   geocode: TextEditingController(),
    //   nationality: "",
    //   educateAddress: TextEditingController(),
    //   isEmployee: "0",
    //   address: TextEditingController(),
    //   realtionShipOfTheHeadHouse: "",
    //   nationallityEditingController: TextEditingController(),
    //   gender: "male",
    //   checkAge: false,
    //   refuseToTellAge: false,
    //   needAge: TextEditingController(),
    // )
    PersonModel(
      personalHeadData: PersonalHeadData(),
      personalQuestion: PersonalQuestion(),
      occupationModel: OccupationModel(),
    ),
  ];
}

class TripModeList {
  static List<TripsModel> tripModeList = [
    TripsModel(
      type: false,
      isTravelAlone: false,
      tripReason: "",//whereDidYouGo
      purposeTravel: "",
      departureTime: "",
      travelTypeModel: TravelTypeModel(
        carParkingPlace: "",
        taxiFare: TextEditingController(),
        taxiTravelType: '',
        passTravelType: '',
        publicTransportFare: '',
      ),
      travelWay: TravelWay(
        mainMode: "",
        accessMode: "",
      ),
      travelWithOtherModel: TravelWithOtherModel(
        adultsNumber: TextEditingController(),
        childrenNumber: TextEditingController(),
        hhsMembersTraveled: "",
        nonHHSAdultsNumber: TextEditingController(),
        nonHHSChildrenNumber: TextEditingController(),
      ),
      arrivalDepartTime: ArrivalDepartTime(
        arriveDestinationTime: '',
        departTime: '',
        numberRepeatTrip: '',
      ),
      startBeginningModel: StartBeginningModel(
        area: TextEditingController(),
        buildingName: TextEditingController(),
        city: TextEditingController(),
        block: TextEditingController(),
        nearestLandMark: TextEditingController(),
        streetName: TextEditingController(),
        streetNumber: TextEditingController(),
        referToMap: TextEditingController(),
      ),
      endingAddress: StartBeginningModel(
        area: TextEditingController(),
        buildingName: TextEditingController(),
        city: TextEditingController(),
        block: TextEditingController(),
        nearestLandMark: TextEditingController(),
        streetName: TextEditingController(),
        streetNumber: TextEditingController(),
        referToMap: TextEditingController(),
      ),
    )
    // TripModel(
    //     typeTravel: "",
    //     depart: TextEditingController(),
    //     destination: TextEditingController(),
    //     travelAloneHouseHold: AdultsModel(
    //         adultsPlus18: TextEditingController(),
    //         adultsMin18: TextEditingController(),
    //         text: "Non Household persons"),
    //     travelAloneWithOther: AdultsModel(
    //         adultsPlus18: TextEditingController(),
    //         adultsMin18: TextEditingController(),
    //         text: "?If with other how many"),
    //     expectedDeparture: TextEditingController(),
    //     editingController3: EditingController3(
    //         peopleUnder18: TextEditingController(),
    //         totalNumber: TextEditingController(),
    //         peopleAdults18: TextEditingController()),
    //     typeTravelCondition: "0")
  ];
}

class VehModel {
  static EditingController3 editingController3 = EditingController3(
    peopleUnder18: TextEditingController(),
    totalNumber: TextEditingController(),
    peopleAdults18: TextEditingController(),
  );
  static List<VehicleBodyDetails> vecCar = [];
  static List<VehicleBodyDetails> vecVan = [];
  static List<VehicleBodyDetails> largeCar = [];
  static List<VehicleBodyDetails> eScooter = [];
  static List<VehicleBodyDetails> pickUp = [];
  static List<VehicleBodyDetails> other = [];
  static String fuelTypeCode = "";
  static String ownerShipCode = "";
  static String parkThisCar = "";
  static String nearestPublicTransporter = "";
}
