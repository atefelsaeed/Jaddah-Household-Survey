import 'package:jaddah_household_survey/Data/HouseholdPart1/all_data.dart';
import 'package:jaddah_household_survey/Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import 'package:jaddah_household_survey/Providers/survey.dart';
import 'package:provider/provider.dart';

class SaveVehiclesData {
  static saveData(context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: true);
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

    survey.vehiclesData.vehiclesBodyType = [
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