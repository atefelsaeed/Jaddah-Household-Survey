import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
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
    var base = PersonModelList.personModelList[widget.i];
    return Column(
      children: [
        ListViewCheckBoxOrange(
          map: PersonData.nationality,
          onChange: (r) {
            base.personalHeadData!.nationalityType = r;

            if (base.personalHeadData!.nationalityType != "سعودي") {
              setState(() {
                showText = true;
                PersonData.nationality["isChick"] = true;
                base.personalHeadData!.nationality.text = "";
              });
            } else {
              setState(() {
                showText = false;
                base.personalHeadData!.nationality.text = "سعودي";
              });
            }
          },
          isListView: true,
          title: "الجنسية ",
          question: PersonData.nationality[PersonData.nationality.keys.first]!
              .toList(),
          subTitle:
              " في حالة ازدواج الجنسية ؛ يرجى تسجيل جواز السفر / الجنسية التي يحمل عليها الشخص تأشيرة الإقامة في المملكة العربية السعودية ",
        ),
        AppSize.spaceHeight2(context),
        (showText == true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyTextForm(
                    label: "أدخل جنسيتك",
                    controller: base.personalHeadData!.nationality,
                    onChanged: (String? val) {
                      print('object');
                      print(base.personalHeadData!.nationality.text);
                    },
                  ),
                  AppSize.spaceWidth2(context),
                  TextGlobal(
                    text: "اكتب جنسيتك",
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
