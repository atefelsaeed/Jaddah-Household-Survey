import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/custom_buttton.dart';

class ActionVecScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return  DefaultButton(
   function: () {

     //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
   },
   isWidget: true,
   text: "Finish",
   widget: const Icon(Icons.arrow_forward),
 );
  }






}