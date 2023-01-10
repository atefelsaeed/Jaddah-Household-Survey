import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
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