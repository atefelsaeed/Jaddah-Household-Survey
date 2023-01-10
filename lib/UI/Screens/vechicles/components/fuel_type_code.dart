import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Widgets/dropdown_form_input.dart';

class FuelTypeCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    DropDownFormInput(
      label: Text(VehiclesData
          .fuelTypeCodes[VehiclesData.fuelTypeCodes.keys.first]!
          .toList()
          .first
          .toString()),
      hint: VehiclesData.fuelTypeCodes.keys.first.toString(),
      options: VehiclesData
          .fuelTypeCodes[VehiclesData.fuelTypeCodes.keys.first]!
          .toList(),
      onChange: (String? p) {

        VehModel.fuelTypeCode=p.toString();
      },
    ),
  ],
);
  }



}