import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import 'adults_or_not.dart';
import 'headline_trip.dart';

class TravelAlone extends StatefulWidget {
  final int index;

  const TravelAlone({super.key, required this.index});

  @override
  State<TravelAlone> createState() => _TravelAloneState();
}

class _TravelAloneState extends State<TravelAlone> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const HeadlineTrip(text: "هل سافرت بمفردك أم مع آخرین؟"),
            Row(children: [
              TextGlobal(
                text: "مع اخرين",
                //[index].title,
                fontSize: height(context) * .02,
                color: ColorManager.grayColor,
              ),
              Checkbox(
                  side: BorderSide(
                    color: ColorManager.orangeTxtColor,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  checkColor: ColorManager.whiteColor,
                  focusColor: ColorManager.orangeTxtColor,
                  activeColor: ColorManager.orangeTxtColor,
                  value: TripModeList.tripModeList[widget.index].isTravelAlone,
                  onChanged: (bool? value) {
                    setState(() {
                      TripModeList.tripModeList[widget.index].isTravelAlone =
                      value!;
                    });
                  }),
            ]),
          ],
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              label: Text(TripData.memberHouseHoldTravel[
                      TripData.memberHouseHoldTravel.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: "اي من أفراد الأسرة سافر معك؟",
              options: TripData.memberHouseHoldTravel[
                      TripData.memberHouseHoldTravel.keys.first]!
                  .toList(),
              onChange: (String? p) {},
            ),
          ],
        ),
      ],
    );
  }
}
