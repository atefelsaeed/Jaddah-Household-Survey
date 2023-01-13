import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class PurposeOfTheBeing extends StatefulWidget {
  final int indexTripModel;

  const PurposeOfTheBeing({super.key, required this.indexTripModel});

  @override
  State<PurposeOfTheBeing> createState() => _PurposeOfTheBeing();
}

class _PurposeOfTheBeing extends State<PurposeOfTheBeing> {
  int chosenIndex = 0;

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
                  print(value);
                  setState(() {
                    TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                        [chosenIndex]["isChick"] = false;
                    print(chosenIndex);

                    chosenIndex = index;

                    TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                        [chosenIndex]["isChick"] = true;
                    TripModeList
                            .tripModeList[widget.indexTripModel].purposeTravel =
                        TripData.purposeOfBeingThere["QPurposeOfBeingThere"]
                            [chosenIndex]["value"];
                  });
                }),
          ]),
        ),
      ),
    );
  }
}
