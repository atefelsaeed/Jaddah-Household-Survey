import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';

class DefaultEntry extends StatefulWidget {
  final int i;
  final Function function;

  const DefaultEntry({
    super.key,
    required this.i,
    required this.function,
  });

  @override
  State<DefaultEntry> createState() => _DefaultEntryState();
}

class _DefaultEntryState extends State<DefaultEntry> {
  @override
  Widget build(BuildContext context) {
    int index = widget.i + 1;
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            TextGlobal(
              text: "الشخص  ${index.toString()}",
              fontSize: height(context) * .023,
              color: ColorManager.orangeTxtColor,
            ),
            const Spacer(),
            widget.i >= 1
                ? IconButton(
                    onPressed: () {
                      widget.function();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: ColorManager.primaryColor,
                    ))
                : Container()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: Text(PersonData.gender[PersonData.gender.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: " نوع الجنس",
              options:
                  PersonData.gender[PersonData.gender.keys.first]!.toList(),
              onChange: (String? p) {
                setState(() {
                  PersonModelList.personModelList[widget.i].personalHeadData!
                      .gender = p.toString();
                });
              },
            ),
            (PersonModelList.personModelList[widget.i].personalHeadData!
                            .gender ==
                        'ذكر' ||
                    PersonModelList.personModelList[widget.i].personalHeadData!
                            .gender ==
                        '')
                ? DropDownFormInput(
                    label: Text(PersonData.relationshipToTheHeadOfHouseholdMan[
                            PersonData.relationshipToTheHeadOfHouseholdMan.keys
                                .first]!
                        .toList()
                        .first
                        .toString()),
                    hint: "القرابة برب الأسرة ",
                    options: PersonData.relationshipToTheHeadOfHouseholdMan[
                            PersonData.relationshipToTheHeadOfHouseholdMan.keys
                                .first]!
                        .toList(),
                    onChange: (var p) {
                      setState(() {
                        PersonModelList
                            .personModelList[widget.i]
                            .personalHeadData!
                            .relationshipHeadHHS = p.toString();
                      });
                    },
                  )
                : DropDownFormInput(
                    label: Text(PersonData
                        .relationshipToTheHeadOfHouseholdWoman[PersonData
                            .relationshipToTheHeadOfHouseholdWoman.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint: "القرابة برب الأسرة ",
                    options: PersonData.relationshipToTheHeadOfHouseholdWoman[
                            PersonData.relationshipToTheHeadOfHouseholdWoman
                                .keys.first]!
                        .toList(),
                    onChange: (var p) {
                      setState(() {
                        PersonModelList
                            .personModelList[widget.i]
                            .personalHeadData!
                            .relationshipHeadHHS = p.toString();
                      });
                    },
                  ),
          ],
        ),
      ],
    );
  }
}
