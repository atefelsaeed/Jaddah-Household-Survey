import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/vechelis_data.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';

class BodyTypeVehicles extends StatelessWidget {
  const BodyTypeVehicles({super.key,required this.vecBodyType,required this.index,required this.title});
  final VecBodyType vecBodyType;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
        ),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [

            TextGlobal(
              fontWeight: FontWeight.bold,
              text: "${index.toString()} ${title.toString()}",
              fontSize: height(context) * .02,
              color: ColorManager.orangeTxtColor,


            ),
            TextGlobal(
              text: " Vehicle body type ",
              fontSize: height(context) * .02,
              color: ColorManager.grayColor,
              fontWeight: FontWeight.bold,
            ),
          ],),
          AppSize.spaceHeight2(context),
          Directionality(
            textDirection: TextDirection.ltr,

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              TextFormer(controller: vecBodyType.fuel,text: "QHV1-2 Fuel",label: "Enter ${vecBodyType.fuel}",headLabel: title,),
              TextFormer(controller: vecBodyType.model,text: "QHV1-3-Model",label: "Enter ${vecBodyType.model}",headLabel: title,)

            ],),
          ),
          AppSize.spaceHeight1(context),
          Directionality(
            textDirection: TextDirection.ltr,

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              TextFormer(controller: vecBodyType.fuel,text: "QHV1-4- Annual Mileage",label: "Enter ${vecBodyType.annual}",headLabel: title,),
              TextFormer(controller: vecBodyType.model,text: "QHV1-5- Age of vehicle",label: "Enter ${vecBodyType.ageOfVec}",headLabel: title,)

            ],),
          ),
          AppSize.spaceHeight1(context),
          Directionality(
            textDirection: TextDirection.ltr,

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              TextFormer(controller: vecBodyType.fuel,text: "QHV1-4- Annual Mileage",label: "Enter ${vecBodyType.annual}",headLabel: title,),
              TextFormer(controller: vecBodyType.model,text: "QHV1-5- Age of vehicle",label: "Enter ${vecBodyType.ageOfVec}",headLabel: title,)

            ],),
          ),
        ],)
    );
  }
}