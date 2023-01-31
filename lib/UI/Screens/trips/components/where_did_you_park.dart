import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

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
        const HeadlineTrip(text: "8. سؤال متعلق بنوع المركبة"),
        const Divider(),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: Text(TripData
                  .whatTypeOfTravel[TripData.whatTypeOfTravel.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: "بماذا ذهبت ؟",
              options: TripData
                  .whatTypeOfTravel[TripData.whatTypeOfTravel.keys.first]!
                  .toList(),
              onChange: (String? p) {
                setState(() {
                  TripModeList.tripModeList[widget.index].travelTypeModel!
                      .travelType = p.toString();
                });
              },
            ),
            TripModeList.tripModeList[widget.index].travelTypeModel!
                        .travelType ==
                    "سيارة"
                ? DropDownFormInput(
                    label: Text(TripData
                        .whereDidYouPark[TripData.whereDidYouPark.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint: "أین أوقفت سیارتك؟",
                    options: TripData
                        .whereDidYouPark[TripData.whereDidYouPark.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      TripModeList.tripModeList[widget.index].travelTypeModel!
                          .carParkingPlace = p.toString();

                      List value = TripData
                          .whereDidYouPark[TripData.whereDidYouPark.keys.first]
                          .toList();
                      setState(() {
                        TripModeList.tripModeList[widget.index].travelTypeModel!
                            .carParkingPlace = p.toString();
                      });
                    })
                : Container(),
            TripModeList.tripModeList[widget.index].travelTypeModel!
                        .travelType ==
                    "تاكسي"
                ? DropDownFormInput(
                    label: Text(TripData
                        .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint: "نوع التاكسي الذي استخدمتھ وكم الأجرة التي دفعتھا؟",
                    options: TripData
                        .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      setState(() {
                        TripModeList.tripModeList[widget.index].travelTypeModel!
                            .taxiTravelType = p.toString();
                      });
                    })
                : Container(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (TripModeList.tripModeList[widget.index].travelTypeModel!
                            .carParkingPlace ==
                        "أخر" &&
                    TripModeList.tripModeList[widget.index].travelTypeModel!
                            .travelType ==
                        "سيارة")
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextForm(
                        controller: TripModeList.tripModeList[widget.index]
                            .travelTypeModel!.otherWhereDidYouParking!,
                        text: "أین أوقفت سیارتك؟",
                        label: "أین أوقفت سیارتك؟",
                      )
                    ],
                  )
                : Container(),
          ],
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TripModeList.tripModeList[widget.index].travelTypeModel!
                          .travelType ==
                      "تاكسي"
                  ? TextForm(
                      controller: widget.costTaxi,
                      text: "كم أجرة التاكسي دفعتھ؟",
                      label: "كم أجرة التاكسي دفعتھ؟",
                      keyboardType: TextInputType.number,
                      isNumber: true,
                    )
                  : Container(),
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        TripModeList.tripModeList[widget.index].travelTypeModel!.travelType ==
                "وسائل النقل العام"
            ? Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextForm(
                      controller: TripModeList
                          .tripModeList[widget.index].travelTypeModel!.taxiFare,
                      text: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
                      label: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
                      keyboardType: TextInputType.number,isNumber: true,
                    ),
                    Column(
                      children: [
                        AppSize.spaceHeight3(context),
                        TextForm(
                          controller: TripModeList.tripModeList[widget.index]
                              .travelTypeModel!.ticketSub,
                          text:
                              " في حالة استخدام تذكرة دائمة، ما نوعھا . فى حالة عدم وجود تذكرة يكتب (لا)",
                          label: "نوع التذكرة",
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
