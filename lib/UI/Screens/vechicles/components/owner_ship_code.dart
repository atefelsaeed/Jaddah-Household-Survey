import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/vechicles_screen.dart';

import '../../../../Data/HouseholdPart1/all_data.dart';
import '../../../../Data/HouseholdPart1/vechelis_data.dart';
import '../../../Widgets/dropdown_form_input.dart';

class OwnerShipCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropDownFormInput(
          label: Text(VehiclesData
              .ownership[VehiclesData.ownership.keys.first]!
              .toList()
              .first
              .toString()),
          hint: VehiclesData.ownership.keys.first.toString(),
          options: VehiclesData
              .ownership[VehiclesData.ownership.keys.first]!
              .toList(),
          onChange: (String? p) {

VehModel.ownerShipCode=p.toString();
          },
        ),
      ],
    );
  }




}