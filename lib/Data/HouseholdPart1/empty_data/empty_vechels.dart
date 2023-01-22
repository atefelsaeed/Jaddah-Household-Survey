import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/editing_controler3.dart';

import '../../../Models/Vehicles_SurveyModel/vehicles_model.dart';
import '../VechelisData/vechelis_data.dart';
import '../VechelisData/veh_model.dart';

class EmptyVehicles {
  static emptyVehicles() {
    VehModel.vecVan = [];
    VehModel.vecWanet = [];
    VehModel.vecCar = [];
    VehModel.pickUp = [];
    VehModel.eScooter = [];
    VehModel.largeCar = [];
    VehiclesData.vecModel.forEach((element) {
      element.textEditingController.text = '';
    });
    VehModel.vehiclesModel = VehiclesModel(
      nearestBusStop: '',
      numberAirTubedAdultsLeisure: '',
      numberAirTubedAdultsWorkUse: '',
      numberAirTubedChildren: '',
      vehicleOwnership: '',
      vehicleParking: '',
      vehicleFuelType: '',
    );

    VehModel.editingController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController(),
    );

    VehModel.fuelTypeCode = "";
    VehModel.parkThisCar = '';
    VehModel.ownerShipCode = '';
  }
}
