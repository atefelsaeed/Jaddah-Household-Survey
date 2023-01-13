import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/transporter_moblity.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';

class EducationLevel extends StatelessWidget {
  final int i;

  const EducationLevel({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var base = PersonModelList.personModelList[i];
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropDownFormInput(
            label: Text(PersonData.busBuss[PersonData.busBuss.keys.first]!
                .toList()
                .first
                .toString()),
            hint: PersonData.busBuss.keys.first.toString(),
            options: PersonData.busBuss[PersonData.busBuss.keys.first]!.toList(),
            onChange: (String? p) {},
          ),
          TextForm(
            controller: base.occupationModel!.earliestTimeStartingWork!,
            text: "Education address -full details and get geocode",
            label: "Education address -full details and get geocode",
          )

        ],
      ),
      TransporterMobilty(index: i)

    ],);


  }
}
