import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/trips_model.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';
import 'headline_trip.dart';

class DepartTime extends StatefulWidget {
  TripsModel tripModel;
  int i;
  final TextEditingController textEditingControl;

  DepartTime(
      {super.key,
      required this.tripModel,
      required this.i,
      required this.textEditingControl});

  @override
  State<DepartTime> createState() => _DepartTimeState();
}

class _DepartTimeState extends State<DepartTime> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeadlineTrip(text: "وقت الوصول والمغادرة"),
        const Divider(),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                fontSize: height(context) * .014,
                controller: widget.tripModel.arrivalDepartTime!.departTime,
                text: "وقت المغادرة",
                label: "وقت المغادرة",
              ),
              TextForm(
                fontSize: height(context) * .012,
                controller:
                    widget.tripModel.arrivalDepartTime!.arriveDestinationTime,
                text: "وقت الوصول",
                label: "وقت الوصول",
              ),
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              label: Text(TripData.howOftenDoYouMakeThisTrip[
                      TripData.howOftenDoYouMakeThisTrip.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: "كم مرة تقوم بهذە الرحلة؟",
              options: TripData.howOftenDoYouMakeThisTrip[
                      TripData.howOftenDoYouMakeThisTrip.keys.first]!
                  .toList(),
              onChange: (String? p) {
                setState(() {
                  TripModeList.tripModeList[widget.i].arrivalDepartTime
                      ?.numberRepeatTrip = p;
                });
              },
            ),
          ],
        ),
        TripModeList.tripModeList[widget.i].arrivalDepartTime == "Other"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextForm(
                    controller: widget.textEditingControl,
                    text: "أكواد نوع الوقود",
                    label: "أكواد نوع الوقود",
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
