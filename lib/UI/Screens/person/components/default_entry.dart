import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/all_data.dart';
import '../../../../Data/HouseholdPart1/person_data.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';
import '../../Survey/widgets/list_view_check_box_orange.dart';

class DefaultEntry extends StatefulWidget {
   final int i;
  const DefaultEntry({super.key,required this.i});

  @override
  State<DefaultEntry> createState() => _DefaultEntryState();
}

class _DefaultEntryState extends State<DefaultEntry> {
  @override
  Widget build(BuildContext context) {
    int index=widget.i+1;
    // TODO: implement build
    return Column(
      children: [
        TextGlobal(
          text: "Person ${index.toString()}",
          fontSize: height(context) * .023,
          color: ColorManager.orangeTxtColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropDownFormInput(
              label: Text(PersonData.gender[PersonData.gender.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.gender.keys.first.toString(),
              options:
                  PersonData.gender[PersonData.gender.keys.first]!.toList(),
              onChange: (String? p) {},
            ),
            DropDownFormInput(
              label: Text(PersonData.relationshipToTheHeadOfHousehold[
                      PersonData.relationshipToTheHeadOfHousehold.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.relationshipToTheHeadOfHousehold.keys.first
                  .toString(),
              options: PersonData.relationshipToTheHeadOfHousehold[
                      PersonData.relationshipToTheHeadOfHousehold.keys.first]!
                  .toList(),
              onChange: (var p) {

                print(p);
              },
            ),
          ],
        ),


      ],
    );
  }
}