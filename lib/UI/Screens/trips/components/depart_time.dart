import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/trips_model.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';
import 'headline_trip.dart';

class DepartTime extends StatelessWidget {
  TripsModel tripModel;

  DepartTime({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeadlineTrip(text: "Arrival & Depart time"),
        const Divider(),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                fontSize: height(context) * .012,
                controller: tripModel.arrivalDepartTime!.arriveDestinationTime!,
                text:
                    "What time did you arrive at the destination ,inclusive of the time spent finding parking space?",
                label:
                    "What time did you arrive at the destination ,inclusive of the time spent finding parking space?",
              ),
              TextForm(
                fontSize: height(context) * .014,
                controller: tripModel.arrivalDepartTime!.departTime!,
                text: "What time did you depart?",
                label: "What time did you depart?",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropDownFormInput(
              label: Text(TripData.howOftenDoYouMakeThisTrip[
                      TripData.howOftenDoYouMakeThisTrip.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: TripData.howOftenDoYouMakeThisTrip.keys.first.toString(),
              options: TripData.howOftenDoYouMakeThisTrip[
                      TripData.howOftenDoYouMakeThisTrip.keys.first]!
                  .toList(),
              onChange: (String? p) {},
            ),
          ],
        ),
      ],
    );
  }
}
