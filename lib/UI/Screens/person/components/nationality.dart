import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/all_data.dart';

import '../../../../Data/HouseholdPart1/person_data.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';
import '../../Survey/widgets/list_view_check_box_orange.dart';

class Nationality extends StatefulWidget {
  final int i;

  const Nationality({
    super.key,
    required this.i,
  });

  @override
  State<Nationality> createState() => _NationalityState();
}

class _NationalityState extends State<Nationality> {
  late bool showText = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ListViewCheckBoxOrange(
          onChange: (r) {
            PersonModelList.personModelList[widget.i].nationality = r;
            if (PersonModelList.personModelList[widget.i].nationality !=
                "Saudi National") {
              setState(() {
              showText=true;
              });
            }else{
              setState(() {
                showText=false;
              });

            }

            print(PersonModelList.personModelList[widget.i].nationality);
          },
          title: "Nationality",
          question: PersonData.nationality[PersonData.nationality.keys.first]!
              .toList(),
          subTitle:
              "Nationality -In case one has dual nationality; please record passport/nationality on which a person has the UAE residence visa ",
        ),
        AppSize.spaceHeight2(context),
        showText == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyTextForm(
                    label: PersonModelList.personModelList[widget.i].nationality,
                    controller: PersonModelList.personModelList[widget.i]
                        .nationallityEditingController,
                  ),
                  AppSize.spaceWidth2(context),
                  TextGlobal(
                    text: "Write down your nationality",
                    fontSize: height(context) * .023,
                    color: ColorManager.gray2Color,
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
