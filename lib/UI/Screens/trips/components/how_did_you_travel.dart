import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/all_data.dart';

import '../../../../Data/HouseholdPart1/trip_data.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import 'headline_trip.dart';

class HowDidYouTravel extends StatelessWidget {
  final int i;
  HowDidYouTravel({required this.i});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(children: [
     const HeadlineTrip(text: "?How did you travel"),
     const Divider(),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         DropDownFormInput(
           label: Text(TripData
               .AcMode[TripData.AcMode.keys.first]!
               .toList()
               .first
               .toString()),
           hint: TripData.AcMode.keys.first.toString(),
           options: TripData.AcMode[TripData.AcMode.keys.first]!
               .toList(),
           onChange: (String? p) {
             TripModeList.tripModeList[i].accessMode=p.toString();
           },
         ),
         DropDownFormInput(
           label: Text(TripData
               .mainMade[TripData.mainMade.keys.first]!
               .toList()
               .first
               .toString()),
           hint: TripData.mainMade.keys.first.toString(),
           options: TripData
               .mainMade[TripData.mainMade.keys.first]!
               .toList(),
           onChange: (String? p) {
             TripModeList.tripModeList[i].mainMode=p.toString();
           },
         ),
       ],
     ),
     AppSize.spaceHeight2(context),
   ],);
  }



}

