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
        const HeadlineTrip(text: "سؤال متعلق بنوع المركبة"),
        const Divider(),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            DropDownFormInput(
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
                  TripModeList.tripModeList[widget.index].travelTypeModel!.carParkingPlace =
                      p.toString();

                  List value = TripData
                      .whereDidYouPark[TripData.whereDidYouPark.keys.first]
                      .toList();
                  setState(() {
                    TripModeList.tripModeList[widget.index].travelTypeModel!.carParkingPlace =
                        p.toString();

                    for (int inr = 0; inr < value.length; inr++) {
                      if (p == "Dropped Off - taxi") {

                          TripModeList.tripModeList[widget.index]
                              .typeTravelCondition = "1";



                      }else{
                        TripModeList.tripModeList[widget.index]
                            .typeTravelCondition = "0";
                      }
                    }
                  });
                }),

            TripModeList.tripModeList[widget.index].typeTravelCondition == "1"
                ? DropDownFormInput(
                    label: Text(TripData
                        .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint: "بماذا سافرت ؟",
                    options: TripData
                        .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      setState(() {
                        TripModeList.tripModeList[widget.index].travelTypeModel!.taxiTravelType =
                            p.toString();
                      });

                      print(TripModeList.tripModeList[widget.index].travelTypeModel!.taxiTravelType);
                    },
                  )
                : Container(),

          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          TripModeList.tripModeList[widget.index].travelTypeModel!.carParkingPlace=="Other"? Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            TextForm(

              controller:TripModeList.tripModeList[widget.index].travelTypeModel!.otherWhereDidYouParking!,
              text: "أین أوقفت سیارتك؟",
              label: "أین أوقفت سیارتك؟",
            )
          ],):Container(),
          TripModeList.tripModeList[widget.index].travelTypeModel!.taxiTravelType=="Other"? Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            TextForm(

              controller:TripModeList.tripModeList[widget.index].travelTypeModel!.taxiTravelTypeOther!,
              text: "بماذا سافرت ؟",
              label: "بماذا سافرت ؟",
            )
          ],):Container(),
        ],),



        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TripModeList.tripModeList[widget.index].typeTravelCondition == "1"
                  ? TextForm(
                      controller: widget.costTaxi,
                      text: "كم أجرة التاكسي دفعتھ؟",
                      label: "كم أجرة التاكسي دفعتھ؟",
                    )
                  : Container(),

            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        TripModeList.tripModeList[widget.index].travelTypeModel!.carParkingPlace=="public Transporter"?     Directionality(
    textDirection: TextDirection.ltr,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextForm(
          controller: TripModeList.tripModeList[widget.index].travelTypeModel!.taxiFare,
          text: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
          label: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
        ),
           Column(children: [
             AppSize.spaceHeight3(context),
             TextForm(
               controller: TripModeList.tripModeList[widget.index].travelTypeModel!.ticketSub,
               text: "في حالة استخدام تذكرة دائمة، ما نوعھا",
               label: "في حالة استخدام تذكرة دائمة، ما نوعھا",
             ),

           ],)


      ],
    ),
  ):Container(),
      ],
    );
  }
}
