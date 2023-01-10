import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class WhyDidYouGo extends StatefulWidget {
  final int indexTripModel;

  const WhyDidYouGo({super.key, required this.indexTripModel});

  @override
  State<WhyDidYouGo> createState() => _WhyDidYouGoState();
}

class _WhyDidYouGoState extends State<WhyDidYouGo> {
  int chosenindex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView.builder(
        primary: true,
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: TripData.purposeOfBeingThere["QPurposeOfBeingThere"].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 4),
        itemBuilder: (context, index) => SizedBox(
          width: width(context) / 2,
          child: Row(children: [
            SizedBox(
              width: width(context) * .23,
              child: TextGlobal(
                text: TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                    [index]["value"],
                //[index].title,
                fontSize: height(context) * .02,
                color: ColorManager.grayColor,
              ),
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
                value: TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                    [index]["isChick"],
                onChanged: (bool? value) {
                  setState(() {
                    TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                        [chosenindex]["isChick"] = false;
                    chosenindex = index;
                    TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                        [chosenindex]["isChick"] = true;
                    TripModeList
                            .tripModeList[widget.indexTripModel].tripReason =
                        TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                            [chosenindex]["value"];
                  });
                }),
          ]),
        ),
      ),
    );
  }
}
