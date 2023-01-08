import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/vechicles_screen.dart';

import '../../../../Data/HouseholdPart1/all_data.dart';
import '../../../../Data/HouseholdPart1/vechelis_data.dart';
import '../../Survey/widgets/list_view_check_box_orange.dart';

class NearestTransporter extends StatelessWidget {
  const NearestTransporter({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return ListViewCheckBoxOrange(
      onChange: (r){
        print(r);
        VehModel.nearestPublicTransporter=r.toString();
      },
      title: VehiclesData.q3VecData.keys.first,
      question: VehiclesData
          .q3VecData[VehiclesData.q3VecData.keys.first]!
          .toList(),
      subTitle: "",
    );
  }



}