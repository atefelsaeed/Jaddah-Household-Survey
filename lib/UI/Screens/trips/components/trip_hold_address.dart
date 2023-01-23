import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../../Resources/sizes.dart';
import '../../Survey/widgets/text_form_row.dart';

class TripHoldAddress extends StatelessWidget {
  final StartBeginningModel tripModel;
  final String titel;

  const TripHoldAddress({
    super.key,
    required this.tripModel,
    required this.titel,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        HeadlineTrip(text: titel),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: tripModel.area,
                text: "الحى",
                label: "الحى",
              ),
              TextForm(
                controller: tripModel.streetNumber,
                text: "رقم الشارع",
                label: "رقم الشارع",
                keyboardType: TextInputType.number,
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: tripModel.streetName,
                label: "إسم الشارع",
                text: "إسم الشارع",
              ),
              TextForm(
                controller: tripModel.nearestLandMark,
                label: "اقرب معلم",
                text: "اقرب معلم",
              )
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: tripModel.block,
                text: "أقرب تقاطع",
                label: "أقرب تقاطع",
              ),
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
