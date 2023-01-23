import 'package:flutter/material.dart';

import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';
import 'fuel_type_code.dart';

class BodyTypeVehicles extends StatefulWidget {
  const BodyTypeVehicles({
    super.key,
    required this.vecBodyType,
    required this.index,
    required this.title, required this.function,
  });

  final VehicleBodyDetails vecBodyType;
  final int index;
  final String title;
  final Function function;

  @override
  State<BodyTypeVehicles> createState() => _BodyTypeVehiclesState();
}

class _BodyTypeVehiclesState extends State<BodyTypeVehicles> {
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
                const Spacer(),
                TextGlobal(
                  fontWeight: FontWeight.bold,
                  text: "${widget.index.toString()} ${widget.title.toString()}",
                  fontSize: height(context) * .02,
                  color: ColorManager.orangeTxtColor,
                ),
                // TextGlobal(
                //   text: " هيكل السيارة",
                //   fontSize: height(context) * .02,
                //   color: ColorManager.grayColor,
                //   fontWeight: FontWeight.bold,
                // ),
                const Spacer(),
                IconButton(
                    onPressed:(){
                      widget.function();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: ColorManager.primaryColor,
                    ))
              ],
            ),
            AppSize.spaceHeight2(context),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormer(
                    controller: widget.vecBodyType.vehicleFuel,
                    text: "الوقود",
                    label: "أدخل  ${widget.vecBodyType.vehicleFuel}",
                    headLabel: widget.title,
                  ),
                  TextFormer(
                    controller: widget.vecBodyType.vehicleOwner,
                    text: "من يملك السيارة",
                    label: "أدخل  ${widget.vecBodyType.vehicleOwner}",
                    headLabel: widget.title,
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

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              FuelTypeCode(
                textEditingController:widget.vecBodyType.fuelTypeCode ,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormer(
                      controller: widget.vecBodyType.vehicleModel,
                      text: "أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات ",
                      label: "أدخل  ${widget.vecBodyType.vehicleModel}",
                      headLabel: widget.title,
                    )
                  ],
                ),
              ),
            ],),
            AppSize.spaceHeight1(context),

          ],
        ));
  }
}
