import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/sizes.dart';
import 'adults_or_not.dart';

class TravelAlone extends StatefulWidget {
  final int index;

  const TravelAlone({super.key, required this.index});

  @override
  State<TravelAlone> createState() => _TravelAloneState();
}

class _TravelAloneState extends State<TravelAlone> {
  bool isTravel = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ListViewCheckBoxOrange(
          map: TripData.travelWithOther,
          onChange: (ChangeBoxResponse r) {
            setState(() {
              if (r.val == "بمفردك") {
                TripModeList.tripModeList[widget.index].isTravelAlone = false;
              } else if (r.val == "مع الأخرين" && r.check == true) {
                TripModeList.tripModeList[widget.index].isTravelAlone = true;
              } else {
                TripModeList.tripModeList[widget.index].isTravelAlone = false;
              }
            });
          },
          isListView: true,
          title: "7. هل ذهبت بمفردك أم مع آخرین؟",
          question: TripData
              .travelWithOther[TripData.travelWithOther.keys.first]!
              .toList(),
          subTitle: "",
        ),
        const Divider(),
        TripModeList.tripModeList[widget.index].isTravelAlone == true
            ? AdultsOrNot(
                adultsModel: TripModeList
                    .tripModeList[widget.index].travelWithOtherModel!)
            : Container(),
        AppSize.spaceHeight2(context),
        TripModeList.tripModeList[widget.index].isTravelAlone == true
            ? AdultsOrNot(
                adultsModel: TripModeList
                    .tripModeList[widget.index].travelAloneHouseHold!)
            : Container(),
        AppSize.spaceHeight2(context),
        TripModeList.tripModeList[widget.index].isTravelAlone == true
            ? ListViewCheckBoxOrange2(
                map: TripModeList.tripModeList[widget.index].friendPerson,
                onChange: (ChangeBoxResponse p) {
                  if (TripModeList.tripModeList[widget.index].chosenFriendPerson
                              .contains(p.val) ==
                          false &&
                      p.check == true) {
                    TripModeList.tripModeList[widget.index].chosenFriendPerson
                        .add(p.val);
                  }
                },
                title: "أى من أفراد الاسرة سافر معك؟",
                question: TripModeList
                    .tripModeList[widget.index].friendPerson["friendPerson"],
                subTitle:"أى من أفراد الاسرة سافر معك"
              )
            : Container(),
      ],
    );
  }
}
