import 'package:flutter/cupertino.dart';

import '../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../Models/Vehicles_SurveyModel/vehicles_model.dart';
import '../../../UI/Screens/Survey/Components/q5.dart';

class VehModel {
  static VehiclesModel vehiclesModel = VehiclesModel(
    // vehiclesBodyType: [
    //   VehiclesBodyType(
    //     vehicleTypeName: 'Car',
    //     vehicleTypeQuantity: 1,
    //     vehicleTypeDetails: VehModel.vecCar,
    //   ),
    // ],
    nearestBusStop: '',
    numberAirTubedAdultsLeisure: '',
    numberAirTubedAdultsWorkUse: '',
    numberAirTubedChildren: '',
    vehicleOwnership: '',
    vehicleParking: '',
    vehicleFuelType: '',
  );
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
