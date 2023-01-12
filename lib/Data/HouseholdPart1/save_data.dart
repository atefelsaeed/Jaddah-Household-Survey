import 'package:jaddah_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';
import 'package:jaddah_household_survey/Models/HHS_SurvyModels/hhs_models.dart';
import 'package:jaddah_household_survey/Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import 'package:jaddah_household_survey/Providers/survey.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:provider/provider.dart';

import 'TripsData/trip_mode_list.dart';
import 'VechelisData/veh_model.dart';

class SaveHHSData {
  static saveData(context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: true);
    // survey.
  }
}

class SaveVehiclesData {
  static saveData(context) {
    SurveyPTProvider survey = Provider.of<SurveyPTProvider>(context, listen: false);
    survey.vehiclesData.vehicleFuelType = VehModel.fuelTypeCode;
    survey.vehiclesData.nearestBusStop = VehModel.nearestPublicTransporter;
    survey.vehiclesData.vehicleParking = VehModel.parkThisCar;
    survey.vehiclesData.vehicleOwnership = VehModel.ownerShipCode;
    survey.vehiclesData.numberAirTubedAdultsWorkUse =
        VehModel.editingController3.peopleAdults18.text;
    survey.vehiclesData.numberAirTubedAdultsLeisure =
        VehModel.editingController3.totalNumber.text;
    survey.vehiclesData.numberAirTubedChildren =
        VehModel.editingController3.peopleUnder18.text;

    survey.vehiclesBodyType = [
      VehiclesBodyType(
        vehicleTypeName: 'Car',
        vehicleTypeQuantity: VehModel.vecCar.length,
        vehicleTypeDetails: VehModel.vecCar,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'Van',
        vehicleTypeQuantity: VehModel.vecVan.length,
        vehicleTypeDetails: VehModel.vecVan,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'Large Car',
        vehicleTypeQuantity: VehModel.largeCar.length,
        vehicleTypeDetails: VehModel.largeCar,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'E-Scooter',
        vehicleTypeQuantity: VehModel.eScooter.length,
        vehicleTypeDetails: VehModel.eScooter,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'Pick Up',
        vehicleTypeQuantity: VehModel.pickUp.length,
        vehicleTypeDetails: VehModel.pickUp,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'Other',
        vehicleTypeQuantity: VehModel.other.length,
        vehicleTypeDetails: VehModel.other,
      ),
    ];
  }
}

class SavePersonData {
  static saveData(context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: true);
    survey.personData = PersonModelList.personModelList;
  }
}

class SaveTripsData {
  static saveData(context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: true);
    survey.tripsList = TripModeList.tripModeList;
  }
}
