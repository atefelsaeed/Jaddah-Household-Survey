import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import '../provider/vechiels_provider.dart';

class LargeItemCar extends StatelessWidget {
  const LargeItemCar({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<VecProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropDownFormInput(
          label: textEditingController.text == ''
              ? const Text('إختار')
              : Text(textEditingController.text),
          hint: "نوع الشاحنة",
          options: VehiclesData
              .largeCar[VehiclesData.largeCar.keys.first]!
              .toList(),
          onChange: (String? p) {
            validationService.largeItemCar(p.toString(), textEditingController);
          },
        ),
        ((textEditingController.text == "أخرى") ||
            !(VehiclesData.largeCar[VehiclesData.largeCar.keys.first]!
                .any((element) => element ==textEditingController.text)))
            ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: width(context) * .45,
                      child: TextGlobal(
                        text: "نوع الشاحنة",
                        fontSize: height(context) * .02,
                        color: ColorManager.black,
                      )),
                  AppSize.spaceHeight1(context),
                  MyTextForm(
                    controller: textEditingController,
                    label: "نوع الشاحنة",
                    onChanged: (val) {
                      textEditingController.text = val!;
                    },
                  ),
                ])
          ],
        )
            : Container(),
      ],
    );
  }
}
