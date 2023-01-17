import 'package:flutter/material.dart';

import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';

class BodyTypeVehicles extends StatelessWidget {
  const BodyTypeVehicles({
    super.key,
    required this.vecBodyType,
    required this.index,
    required this.title,
  });

  final VehicleBodyDetails vecBodyType;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextGlobal(
                  fontWeight: FontWeight.bold,
                  text: "${index.toString()} ${title.toString()}",
                  fontSize: height(context) * .02,
                  color: ColorManager.orangeTxtColor,
                ),
                TextGlobal(
                  text: " هيكل السيارة",
                  fontSize: height(context) * .02,
                  color: ColorManager.grayColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            AppSize.spaceHeight2(context),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormer(
                    controller: vecBodyType.vehicleFuel,
                    text: "الوقود",
                    label: "أدخل  ${vecBodyType.vehicleFuel}",
                    headLabel: title,
                  ),
                  TextFormer(
                    controller: vecBodyType.vehicleOwner,
                    text: "من يملك السيارة",
                    label: "أدخل  ${vecBodyType. vehicleOwner}",
                    headLabel: title,
                  )
                ],
              ),
            ),
            // AppSize.spaceHeight1(context),
            // Directionality(
            //   textDirection: TextDirection.ltr,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       TextFormer(
            //         controller: vecBodyType.vehicleAnnualMileage,
            //         text: "QHV1-4- Annual Mileage",
            //         label: "أدخل  ${vecBodyType.vehicleAnnualMileage}",
            //         headLabel: title,
            //       ),
            //       TextFormer(
            //         controller: vecBodyType.vehicleAge,
            //         text: "QHV1-5- Age of vehicle",
            //         label: "أدخل  ${vecBodyType.vehicleAge}",
            //         headLabel: title,
            //       )
            //     ],
            //   ),
            // ),
            AppSize.spaceHeight1(context),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormer(
                    controller: vecBodyType.vehicleModel,
                    text: "أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات ",
                    label: "أدخل  ${vecBodyType.vehicleModel}",
                    headLabel: title,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
