import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/UI/Screens/trips/components/headline_trip.dart';
import 'package:provider/provider.dart';

import '../../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/alert_map.dart';
import '../../../Widgets/item_text_span.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';
  LatLng? latLng= LatLng(0.0, 0.0);

class TripHoldAddress extends StatefulWidget {
  final StartBeginningModel tripModel;
  final String titel;

  const TripHoldAddress({
    super.key,
    required this.tripModel,
    required this.titel,
  });

  @override
  State<TripHoldAddress> createState() => _TripHoldAddressState();
}

class _TripHoldAddressState extends State<TripHoldAddress> {
  bool isHome = false;

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        HeadlineTrip(text: widget.titel),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        Row(children: [
          TextGlobal(
            text: "المنزل",
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
              value: isHome,
              onChanged: (bool? value) {
                setState(() {
                  isHome = value!;
                  if (isHome == true) {
                    widget.tripModel.tripAddressLong = surveyPt.hhsAddressLong!;
                    widget.tripModel.tripAddressLat = surveyPt.hhsAddressLat!;
                  } else {
                    widget.tripModel.tripAddressLong = "";
                    widget.tripModel.tripAddressLat = "";
                  }
                });
              })
        ]),
        AppSize.spaceHeight2(context),
        Row(
          children: [
            const Image(image: AssetImage(ImageAssets.locationIcon)),
            AppSize.spaceWidth2(context),
            const Text('الإحداثيات'),
            const Spacer(),
            IconButton(
                onPressed: () {
                alertMap( (c){
                            latLng?.latitude!=c.latitude;
                            setState(() {



                           print("123");
                           print(c.latitude);
                           print(latLng?.latitude);
                              latLng?.longitude!=c.longitude;
                            });
                          },);
                },
                icon: Icon(
                  Icons.pin_drop,
                  color: ColorManager.primaryColor,
                  size: width(context) * .1,
                )),
          ],
        ),
        Row(
          children: [
            ItemTextSpan(
                title: "Lat",
                subTitle: latLng?.latitude.toString() ?? ""),
            AppSize.spaceWidth3(context),
            ItemTextSpan(
                title: "Long",
                subTitle: latLng?.longitude.toString() ?? ""),
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}


