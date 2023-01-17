import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/trips_model.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/UI/Widgets/text.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';

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
              Column(
                children: [
                  SizedBox(
                      width: width(context) * .45,
                      child: TextGlobal(
                        text: "وقت المغادرة",
                        fontSize: height(context) * .02,
                        color: ColorManager.black,
                      )),
                  AppSize.spaceHeight1(context),
                  MyTextForm(
                    label: "وقت المغادرة",
                    controller: widget.tripModel.arrivalDepartTime!.departTime,

                    readOnly: true,
                    // set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        setState(() {
                          widget.tripModel.arrivalDepartTime!.departTime.text =
                              pickedTime.format(
                                  context); //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      width: width(context) * .45,
                      child: TextGlobal(
                        text: "وقت الوصول",
                        fontSize: height(context) * .02,
                        color: ColorManager.black,
                      )),
                  AppSize.spaceHeight1(context),
                  MyTextForm(
                    label: "وقت الوصول",
                    controller: widget.tripModel.arrivalDepartTime!.arriveDestinationTime,

                    readOnly: true,
                    // set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        setState(() {
                          widget.tripModel.arrivalDepartTime!.arriveDestinationTime.text =
                              pickedTime.format(
                                  context); //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                    },
                  ),
                ],
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
