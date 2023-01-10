import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';
import 'headline_trip.dart';

class WhereDidYouPark extends StatefulWidget {
  final TextEditingController costTaxi;
  final int index;

  const WhereDidYouPark(
      {super.key, required this.costTaxi, required this.index});

  @override
  State<WhereDidYouPark> createState() => _WhereDidYouParkState();
}

class _WhereDidYouParkState extends State<WhereDidYouPark> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeadlineTrip(text: "?If travelled by car, where did you park"),
        const Divider(),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TripModeList.tripModeList[widget.index].typeTravelCondition == "1"
                ? DropDownFormInput(
                    label: Text(TripData
                        .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint: TripData.whatTypeOfTaxi.keys.first.toString(),
                    options: TripData
                        .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      TripModeList.tripModeList[widget.index].travelTypeModel!.taxiTravelType =
                          p.toString();
                    },
                  )
                : Container(),
            DropDownFormInput(
                label: Text(TripData
                    .whereDidYouPark[TripData.whereDidYouPark.keys.first]!
                    .toList()
                    .first
                    .toString()),
                hint: TripData.whereDidYouPark.keys.first.toString(),
                options: TripData
                    .whereDidYouPark[TripData.whereDidYouPark.keys.first]!
                    .toList(),
                onChange: (String? p) {
                  TripModeList.tripModeList[widget.index].typeTravel =
                      p.toString();
                  List value = TripData
                      .whereDidYouPark[TripData.whereDidYouPark.keys.first]
                      .toList();
                  setState(() {
                    for (int inr = 0; inr < value.length; inr++) {
                      if (p == "Dropped Off - taxi") {
                        setState(() {
                          TripModeList.tripModeList[widget.index]
                              .typeTravelCondition = "1";
                        });
                      }
                    }
                  });
                }),
          ],
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TripModeList.tripModeList[widget.index].typeTravelCondition == "1"
                  ? TextForm(
                      controller: widget.costTaxi,
                      text: "How much taxi fare did you pay?",
                      label: "How much taxi fare did you pay?",
                    )
                  : Container(),
              /*  TextForm(
          controller: widget.tripModel.streetName,
          text: "how much fare did you pay?",
          label: "how much fare did you pay?",
        )*/
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        /*Directionality(
    textDirection: TextDirection.ltr,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextForm(
          controller: widget.tripModel.streetName,
          text: "type of travel pass",
          label: "type of travel pass",
        )
      ],
    ),
  ),*/
      ],
    );
  }
}
