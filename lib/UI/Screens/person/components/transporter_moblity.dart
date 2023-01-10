import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';

class TransporterMobilty extends StatelessWidget {
  final int index;
  const TransporterMobilty({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(children: [
     AppSize.spaceHeight3(context),
     Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [
         DropDownFormInput(
           label: Text(PersonData
               .transporterMoblity[PersonData.transporterMoblity.keys.first]!
               .toList()
               .first
               .toString()),
           hint: PersonData.transporterMoblity.keys.first.toString(),
           options: PersonData
               .transporterMoblity[PersonData.transporterMoblity.keys.first]!
               .toList(),
           onChange: (String? p) {},
         ),
       ],
     ),
   ],);
  }



}