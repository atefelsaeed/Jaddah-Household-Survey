import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';
import '../provider/vechiels_provider.dart';

class ParkThisCar extends StatelessWidget {
  const ParkThisCar({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<VecProvider>(context, listen: false);
    return Column(
      children: [
        DropDownFormInput(
          label: textEditingController.text == ''
              ? const Text('إختار')
              : Text(textEditingController.text),
          hint: "أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات",
          options: VehiclesData
              .parkThisCar[VehiclesData.parkThisCar.keys.first]!
              .toList(),
          onChange: (String? p) {
            validationService.parkThisCar(
              p.toString(),
              textEditingController,
            );
          },
        ),
        ((textEditingController.text == "أخرى") ||
                (textEditingController.text.isNotEmpty &&
                    !(VehiclesData
                        .parkThisCar[VehiclesData.parkThisCar.keys.first]!
                        .any((element) =>
                            element == textEditingController.text))))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ TextForm(
                  controller: textEditingController,
                  text: "رموز نوع وقوف السيارات",
                  label: "رموز نوع وقوف السيارات",
                )
                  // Column(
                  //     children: [
                  //       SizedBox(
                  //           width: width(context) * .45,
                  //           child: TextGlobal(
                  //             text: "رموز نوع وقوف السيارات",
                  //             fontSize: height(context) * .02,
                  //             color: ColorManager.black,
                  //           )),
                  //       AppSize.spaceHeight1(context),
                  //       MyTextForm(
                  //         controller: textEditingController,
                  //         label: "رموز نوع وقوف السيارات",
                  //         onChanged: (val) {
                  //           textEditingController.text = val!;
                  //         },
                  //       ),
                  //     ])
                ],
              )
            : Container(),
      ],
    );
  }
}
