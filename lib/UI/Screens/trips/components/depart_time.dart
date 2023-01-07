
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/trip_screen.dart';

import '../../../../Data/HouseholdPart1/trip_data.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';
import '../model/trip_model.dart';
import '../model/trip_model_editing_controller.dart';
import 'headline_trip.dart';

class DepartTime extends StatelessWidget{
  TripModel tripModel;
  DepartTime({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      const HeadlineTrip(text: "Arrival & Depart time"),
      const Divider(),
      AppSize.spaceHeight2(context),
      Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextForm(
              fontSize: height(context)*.012,
              controller: tripModel.destination,
              text: "What time did you arrive at the destination ,inclusive of the time spent finding parking space?",
              label: "What time did you arrive at the destination ,inclusive of the time spent finding parking space?",
            ),
            TextForm(
              fontSize: height(context)*.014,
              controller: tripModel.depart,
              text: "What time did you depart?",
              label: "What time did you depart?",
            )
          ],
        ),
      ),
      AppSize.spaceHeight2(context),
      Row(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropDownFormInput(
            label: Text(TripData.howOftenDoYouMakeThisTrip[
            TripData
                .howOftenDoYouMakeThisTrip.keys.first]!
                .toList()
                .first
                .toString()),
            hint: TripData.howOftenDoYouMakeThisTrip.keys.first
                .toString(),
            options: TripData.howOftenDoYouMakeThisTrip[TripData
                .howOftenDoYouMakeThisTrip.keys.first]!
                .toList(),
            onChange: (String? p) {},
          ),
        ],
      ),
    ],);
  }


}

