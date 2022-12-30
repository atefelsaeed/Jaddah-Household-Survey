import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:provider/provider.dart';

import '../../../../Helper/validator.dart';
import '../../../../Providers/survey.dart';
import '../../../../Resources/assets_manager.dart';
import '../../../Widgets/dropdown_form_input.dart';

class SurveyHeader extends StatefulWidget {
  SurveyHeader({Key? key}) : super(key: key);

  @override
  State<SurveyHeader> createState() => _SurveyHeaderState();
}

class _SurveyHeaderState extends State<SurveyHeader> {
  DateTime interviewDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Jeddah Model - Household Travel Diary Survey'),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(ImageAssets.logo),
              width: width(context) * .3,
            ),
            Image(
              image: AssetImage(ImageAssets.logo),
              width: width(context) * .3,
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Interview number: #12'),
            Text('Interview day: $interviewDay')
          ],
        ),
        Row(
          children: [
            Text('District Name:'),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                label: Text("District Name"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              validator: (String? value) => Validator.validateEmpty(
                value: value,
                message: "يجب اعطاء اجابة",
              ),
              onChanged: (String? s) {
                //-------------send data to backend------------------
                // survey.data.header.districtName = s!;
                // print(survey.journeyStarDistrictName);
              },
            ),
            const SizedBox(height: 10),
            // DropDownFormInput(
            //   hint: const Text(
            //     "اجرة/طائرة/قطار/إلخ.",
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            //   label: const Text("وسيلة النقل في الذهاب:"),
            //   options: const <TransportType, Widget>{
            //     TransportType.carDriver: Text("سيارة كسائق"),
            //     TransportType.carPassanger: Text("سيارة كراكب"),
            //     TransportType.taxi: Text("أجرة"),
            //     TransportType.plane: Text("طائرة"),
            //     TransportType.crossCityVan: Text("حافلة بين المدن"),
            //     TransportType.train: Text("قطار"),
            //     TransportType.other: Text("أخرى"),
            //   },
            //   onChange: (TransportType? p) {
            //     survey.journeyGoType =
            //         EnumToString.convertToString(p, camelCase: true);
            //   },
            //   validator: (TransportType? value) => Validator.validateChoice(
            //     value: value,
            //     refused: null,
            //     message: "يجب اعطاء اجابة",
            //   ),
            // ),
          ],
        ),
        Row(
          children: [
            Text('Zone Number:'),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                label: Text("Zone Number"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              validator: (String? value) => Validator.validateEmpty(
                value: value,
                message: "يجب اعطاء اجابة",
              ),
              onChanged: (String? s) {
                //-------------send data to backend------------------
                // survey.data.header.districtName = s!;
                // print(survey.journeyStarDistrictName);
              },
            ),
            const SizedBox(height: 10),
            // DropDownFormInput(
            //   hint: const Text(
            //     "اجرة/طائرة/قطار/إلخ.",
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            //   label: const Text("وسيلة النقل في الذهاب:"),
            //   options: const <TransportType, Widget>{
            //     TransportType.carDriver: Text("سيارة كسائق"),
            //     TransportType.carPassanger: Text("سيارة كراكب"),
            //     TransportType.taxi: Text("أجرة"),
            //     TransportType.plane: Text("طائرة"),
            //     TransportType.crossCityVan: Text("حافلة بين المدن"),
            //     TransportType.train: Text("قطار"),
            //     TransportType.other: Text("أخرى"),
            //   },
            //   onChange: (TransportType? p) {
            //     survey.journeyGoType =
            //         EnumToString.convertToString(p, camelCase: true);
            //   },
            //   validator: (TransportType? value) => Validator.validateChoice(
            //     value: value,
            //     refused: null,
            //     message: "يجب اعطاء اجابة",
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
