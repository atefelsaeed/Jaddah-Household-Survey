import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/all_data.dart';
import '../../../../Data/HouseholdPart1/trip_data.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import 'adults_or_not.dart';
import 'headline_trip.dart';

class TravelAlone extends StatefulWidget {
  final int index;
  const TravelAlone({super.key,required this.index});

  @override
  State<TravelAlone> createState() => _TravelAloneState();
}

class _TravelAloneState extends State<TravelAlone> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            TextGlobal(
              text: "With other",
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
                value: TripModeList.tripModeList[widget.index].typeAlone,
                onChanged: (bool? value) {
                  setState(() {
                    TripModeList.tripModeList[widget.index].typeAlone = value!;
                  });
                }),
          ]),
          const HeadlineTrip(
              text: "Did you travel alone or with others?"),
        ],
      ),
      const Divider(),
      TripModeList.tripModeList[widget.index].typeAlone == true
          ? AdultsOrNot(adultsModel: TripModeList.tripModeList[widget.index].travelAloneWithOther)
          : Container(),
      AppSize.spaceHeight2(context),
      TripModeList.tripModeList[widget.index].typeAlone == true?
      AdultsOrNot(adultsModel:TripModeList.tripModeList[widget.index].travelAloneHouseHold ):Container(),

      AppSize.spaceHeight2(context),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropDownFormInput(
            label: Text(TripData.memberHouseHoldTravel[
            TripData.memberHouseHoldTravel.keys.first]!
                .toList()
                .first
                .toString()),
            hint: TripData.memberHouseHoldTravel.keys.first
                .toString(),
            options: TripData.memberHouseHoldTravel[
            TripData.memberHouseHoldTravel.keys.first]!
                .toList(),
            onChange: (String? p) {},
          ),
        ],
      ),
    ],);
  }
}