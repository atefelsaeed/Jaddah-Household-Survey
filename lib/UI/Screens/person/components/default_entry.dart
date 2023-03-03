import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';

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
  bool x = true;
  var womanList = PersonData.relationshipToTheHeadOfHouseholdWoman[
      PersonData.relationshipToTheHeadOfHouseholdWoman.keys.first]!;
  var manList = PersonData.relationshipToTheHeadOfHouseholdMan[
      PersonData.relationshipToTheHeadOfHouseholdMan.keys.first]!;

  @override
  Widget build(BuildContext context) {
    var relationship = PersonModelList
        .personModelList[widget.i].personalHeadData!.relationshipHeadHHS;
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextForm(
              controller: PersonModelList.personModelList[widget.i].personName,
              text: "اسم الشخص",
              label: "اسم الشخص",
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: PersonModelList
                          .personModelList[widget.i].personalHeadData!.gender !=
                      ''
                  ? Text(PersonModelList
                          .personModelList[widget.i].personalHeadData?.gender ??
                      '')
                  : const Text('إختار'),
              hint: " نوع الجنس",
              options:
                  PersonData.gender[PersonData.gender.keys.first]!.toList(),
              onChange: (String? p) {
                setState(() {
                  debugPrint(p);
                  PersonModelList.personModelList[widget.i].personalHeadData!
                      .gender = p.toString();
                  if (p == "ذكر") {
                    setState(() {
                      x = true;
                    });
                  } else {
                    setState(() {
                      x = false;
                    });
                  }
                });
              },
            ),
            x == true
                ? Column(
                    children: [
                      DropDownFormInput(
                        label: relationship != ''
                            ? Text(relationship ?? '')
                            : const Text('إختار'),
                        hint: "القرابة برب الأسرة ",
                        options: manList.toList(),
                        onChange: (var p) {
                          setState(() {
                            relationship = p.toString();
                          });
                        },
                      ),
                      AppSize.spaceHeight2(context),
                      Row(
                        children: [
                           (relationship == 'أخرى')
                              ? MyTextForm(
                                  label: 'القرابة برب الأسرة ',
                                  onChanged: (val) {
                                    relationship = val!;
                                  },
                                )
                              : Container()
                        ],
                      )
                    ],
                  )
                : Container(),
            x == false
                ? Column(
                    children: [
                      DropDownFormInput(
                        label: relationship != ''
                            ? Text(relationship ?? '')
                            : const Text('إختار'),
                        hint: "القرابة برب الأسرة ",
                        options: womanList.toList(),
                        onChange: (var p) {
                          setState(() {
                            relationship = p.toString();
                          });
                        },
                      ),
                      AppSize.spaceHeight2(context),
                      Row(
                        children: [
                      (relationship == 'أخرى')
                              ? MyTextForm(
                                  label: 'القرابة برب الأسرة ',
                                  onChanged: (val) {
                                    relationship = val!;
                                  },
                                )
                              : Container()
                        ],
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
