import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/Trips_SurveyModel/trips_model.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/UI/Widgets/text.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Data/select_time.dart';
import '../../../../Resources/sizes.dart';
import '../../../../Resources/style_manager.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/time_selected_error.dart';
import '../../Survey/widgets/text_form_row.dart';
import 'headline_trip.dart';

extension on DateTime {
  DateTime roundDown({Duration delta = const Duration(minutes: 5)}) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds);
  }
}

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

class _DepartTimeState extends State<DepartTime> with SelectTimeData {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeadlineTrip(text: "9. وقت الوصول والمغادرة"),
        const Divider(),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [  Column(
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
                  controller: widget
                      .tripModel.arrivalDepartTime!.arriveDestinationTime,

                  readOnly: true,
                  // set it true, so that user will not able to edit text
                  onTap: () async {
                    if (widget.tripModel.arrivalDepartTime!
                        .departTime.text.isEmpty) {
                      showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return const TimeSelectedError(
                              title: 'يجب إدخال وقت المغادرة ',
                              content: 'يجب إدخال وقت المغادرة أولاً!',
                            );
                          });
                    } else {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime:
                        TimeOfDay.fromDateTime(DateTime.now().roundDown()),
                        builder: (context, child) {
                          return StyleManager.selectTime(context, child);
                        },
                        context: context,
                      );
                      String arrival = widget.tripModel.arrivalDepartTime!
                          .departTime.text;
                      int newFromTime =
                      int.parse(time12to24Format(arrival.toString()));
                      int picked = int.parse(time12to24Format(
                          pickedTime!.format(context).toString()));
                      if (picked > newFromTime) {
                        setState(() {
                          widget.tripModel.arrivalDepartTime!.arriveDestinationTime
                              .text = pickedTime.format(context); //s
                        });
                      } else {
                        showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return const TimeSelectedError(
                                title: 'يجب إختيار وقت آخر',
                                content:
                                'وقت المغادرة يجب أن يكون قبل وقت الوصول!',
                              );
                            });
                        setState(() {
                          widget.tripModel.arrivalDepartTime!.arriveDestinationTime
                              .text = '';
                        });
                        print("Time is not selected");
                      }
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
                        text: "وقت المغادرة",
                        fontSize: height(context) * .02,
                        color: ColorManager.black,
                      )),
                  AppSize.spaceHeight1(context),
                  MyTextForm(
                    label: "وقت المغادرة",

                    controller: widget.tripModel.arrivalDepartTime!.departTime,
                    readOnly: true,
                    onTap: () async {

                      TimeOfDay? pickedTime =
                      await showTimePicker(
                        builder: (context, child) {
                          return StyleManager.selectTime(context, child);
                        },
                        initialTime: TimeOfDay.fromDateTime(
                            DateTime.now().roundDown()),
                        context: context,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          widget.tripModel.arrivalDepartTime!
                              .departTime.text =
                              pickedTime.format(
                                  context); //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
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
                    text: " نوع الوقود",
                    label: " نوع الوقود",
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
