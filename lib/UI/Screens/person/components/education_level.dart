import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/all_data.dart';
import '../../../../Data/HouseholdPart1/person_data.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';

class EducationLevel  extends StatelessWidget{
  final int i;
  const EducationLevel({super.key,required this.i});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropDownFormInput(
          label: Text(PersonData.busBuss[
          PersonData.busBuss.keys.first]!
              .toList()
              .first
              .toString()),
          hint:
          PersonData.busBuss.keys.first.toString(),
          options: PersonData.busBuss[
          PersonData.busBuss.keys.first]!
              .toList(),
          onChange: (String? p) {},
        ),
        TextForm(
          controller:
          PersonModelList.personModelList[i].educateAddress,
          text: "Education address -full details and get geocode",
          label: "Education address -full details and get geocode",
        )
      ],
    );
  }



}

