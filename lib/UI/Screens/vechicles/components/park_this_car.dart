import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Widgets/dropdown_form_input.dart';

class ParkThisCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropDownFormInput(
          label: Text(VehiclesData
              .parkThisCar[VehiclesData.parkThisCar.keys.first]!
              .toList()
              .first
              .toString()),
          hint: VehiclesData.parkThisCar.keys.first.toString(),
          options: VehiclesData
              .parkThisCar[VehiclesData.parkThisCar.keys.first]!
              .toList(),
          onChange: (String? p) {
            VehModel.parkThisCar = p.toString();
          },
        ),
      ],
    );
  }
}
