

import 'package:flutter/cupertino.dart';

import '../../../Widgets/custom_buttton.dart';

class NextStep extends StatelessWidget {
  const NextStep({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return DefaultButton(
      function: () {

        //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
      },
      isWidget: true,
      text: "Next Step",

    );
  }


}