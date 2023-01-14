import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import 'headline_trip.dart';

class HowDidYouTravel extends StatelessWidget {
  final int i;

  HowDidYouTravel({required this.i});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeadlineTrip(text: "كیف سافرت ؟"),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: Text(TripData.AcMode[TripData.AcMode.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: "الوضع الرئیسي",
              options: TripData.AcMode[TripData.AcMode.keys.first]!.toList(),
              onChange: (String? p) {
                TripModeList.tripModeList[i].travelWay!.mainMode =
                    p.toString();
              },
            ),
            DropDownFormInput(
              label: Text(TripData.mainMade[TripData.mainMade.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: "وضع وصول",
              options:
                  TripData.mainMade[TripData.mainMade.keys.first]!.toList(),
              onChange: (String? p) {
                TripModeList.tripModeList[i].travelWay!.accessMode =
                    p.toString();
              },
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
