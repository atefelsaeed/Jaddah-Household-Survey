import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import 'headline_trip.dart';

class HowDidYouTravel extends StatefulWidget {
  final int i;

  const HowDidYouTravel({super.key, required this.i});

  @override
  State<HowDidYouTravel> createState() => _HowDidYouTravelState();
}

class _HowDidYouTravelState extends State<HowDidYouTravel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController acModeController = TextEditingController();
    TextEditingController mainModeController = TextEditingController();
    return Column(
      children: [
        const HeadlineText(text: "6. كیف ذهبت ؟"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label:
                  TripModeList.tripModeList[widget.i].travelWay!.accessMode !=
                          ''
                      ? Text(TripModeList
                              .tripModeList[widget.i].travelWay!.accessMode ??
                          '')
                      : const Text('إختار'),
              hint: "الوضع الرئیسي",
              options: TripData.AcMode[TripData.AcMode.keys.first]!.toList(),
              onChange: (String? p) {
                setState(() {
                  TripModeList.tripModeList[widget.i].travelWay!.accessMode =
                      p.toString();
                });
              },
            ),
            DropDownFormInput(
              label: TripModeList.tripModeList[widget.i].travelWay!.mainMode !=
                      ''
                  ? Text(
                      TripModeList.tripModeList[widget.i].travelWay!.mainMode ??
                          '')
                  : const Text('إختار'),
              hint: "وضع وصول",
              options:
                  TripData.mainMade[TripData.mainMade.keys.first]!.toList(),
              onChange: (String? p) {
                setState(() {
                  TripModeList.tripModeList[widget.i].travelWay!.mainMode =
                      p.toString();
                });
              },
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TripModeList.tripModeList[widget.i].travelWay!.accessMode == "أخر"
                ? MyTextForm(
                    controller: acModeController,
                    isNumber: false,
                    onChanged: (value) {
                      TripModeList
                          .tripModeList[widget.i].travelWay!.accessMode = value;
                    },
                    label: 'الوضع الرئیسي',
                  )
                : Container(),
            TripModeList.tripModeList[widget.i].travelWay!.mainMode == "أخر"
                ? MyTextForm(
                    controller: mainModeController,
                    isNumber: false,
                    onChanged: (value) {
                      TripModeList.tripModeList[widget.i].travelWay!.mainMode =
                          value;
                    },
                    label: 'وضع وصول',
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
