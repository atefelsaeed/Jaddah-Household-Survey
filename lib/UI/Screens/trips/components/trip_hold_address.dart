import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../../Resources/sizes.dart';
import '../../Survey/widgets/text_form_row.dart';

class TripHoldAddress extends StatelessWidget {
  final StartBeginningModel tripModel;
final String titel;
  const TripHoldAddress({super.key, required this.tripModel, required this.titel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
         HeadlineTrip(text:titel),
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
                controller: tripModel.buildingName!,
                text: "اسم المبنى",
                label: "اسم المبنى",
              ),
              TextForm(
                controller: tripModel.streetName!,
                text: "أسم الشارع",
                label: "أسم الشارع",
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
                controller: tripModel.streetNumber!,
                label: "رقم الشارع",
                text: "رقم الشارع",
              ),
              TextForm(
                controller: tripModel.nearestLandMark!,
                label: "اقرب معلم",
                text: "",
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
                controller: tripModel.block!,
                text: "مجمع / أقرب شارعین متقاطعین",
                label: "مجمع / أقرب شارعین متقاطعین",
              ),
              TextForm(
                controller: tripModel.area!,
                text: "المنطقة (الضاحیة)",
                label: "المنطقة (الضاحیة)",
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
                controller: tripModel.city!,
                text: "المدينة / البلدة",
                label: "Enter City/ Town",
              ),
              // TextForm(
              //   controller: tripModel.referToMap!,
              //   text: "Refer to Map",
              //   label: "Enter Refer to Map ",
              // )
            ],
          ),
        ),
      ],
    );
  }
}
