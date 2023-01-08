import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Resources/sizes.dart';
import '../../Survey/widgets/text_form_row.dart';
import '../model/trip_model.dart';
import '../model/trip_model_editing_controller.dart';
import '../trip_screen.dart';

class TripHoldAddress extends StatelessWidget {
  final TripModelEditingController tripModel;

  const TripHoldAddress({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        const HeadlineTrip(text: "?Where did you start beginning of the day"),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: tripModel.buildingName,
                text: "Building Name",
                label: "Enter Building Name",
              ),
              TextForm(
                controller: tripModel.streetName,
                text: "street Name",
                label: "Enter Street Name",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: tripModel.streetNumber,
                label: "Street Number",
                text: "Enter Street Number",
              ),
              TextForm(
                controller: tripModel.nearestLandMark,
                label: "Nearest Land Mark ",
                text: "Enter Nearest Land Mark ",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: tripModel.blockNearestTwoCrossStreets,
                text: "Block/Nearest two cross streets",
                label: "Enter Block/Nearest two cross streets",
              ),
              TextForm(
                controller: tripModel.area,
                text: "Area (Suburb)",
                label: "Enter Area (Suburb) ",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: tripModel.blockNearestTwoCrossStreets,
                text: "City/ Town",
                label: "Enter City/ Town",
              ),
              //  TextForm(controller: area,text: "Area (Suburb)",label: "Enter Area (Suburb) ",)
            ],
          ),
        ),
      ],
    );
  }
}