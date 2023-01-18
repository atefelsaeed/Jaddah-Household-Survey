import '../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import 'PersonData/person_model_list.dart';
import 'TripsData/trip_mode_list.dart';
import 'VechelisData/veh_model.dart';

class HHSEmptyData{
  static emptyData(){
    TripModeList.tripModeList=[];
    PersonModelList.personModelList=[];
    List<VehiclesBodyType> vehicles = [
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
        vehicleTypeName: 'Wanet',
        vehicleTypeQuantity: VehModel.vecWanet.length,
        vehicleTypeDetails: VehModel.vecWanet,
      )
    ];
    VehModel.editingController3.totalNumber.text="";
    VehModel.fuelTypeCode="";
    VehModel.nearestPublicTransporter='';
    VehModel.parkThisCar='';
    VehModel.ownerShipCode='';
  }
}