import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/VechelisData/veh_model.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/action_vec_screen.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/fuel_type_code.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/motorisedvechiels.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/nearest_transporter.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/park_this_car.dart';
import 'package:provider/provider.dart';

import '../../../Providers/survey_hhs.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/text.dart';
import '../Survey/widgets/text_form_row.dart';
import 'components/controller_vechelies_body.dart';
import 'components/owner_ship_code.dart';
import 'components/q2_vec_screen.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _key,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppSize.spaceWidth1(context),
                        Expanded(
                          child: TextGlobal(
                            text:
                                " Vehicles in the Household - Household Travel Diary Survey",
                            fontSize: height(context) * .023,
                            color: ColorManager.orangeTxtColor,
                          ),
                        ),
                      ],
                    ),
                    AppSize.spaceHeight3(context),
                    const MotorisedVec(),

                    const ControllerVehiclesBody(),
                    const FuelTypeCode(),
                    AppSize.spaceHeight2(context),
                    const OwnerShipCode(),
                    AppSize.spaceHeight2(context),
                    const ParkThisCar(),
                    // AppSize.spaceHeight3(context),
                    //
                    // Q2VecScreen(
                    //   editingController3: VehModel.editingController3,
                    // ),
                    AppSize.spaceHeight3(context),
                    const NearestTransporter(),
                    AppSize.spaceHeight3(context),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFormer(
                            controller: VehModel.editingController3.totalNumber,
                            text: "3. During the past week, how many parcels, groceries, foods, and other supplies did your household receive?",
                            label: "Enter",
                            headLabel: '',
                          ),
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    const ActionVecScreen(),
                    AppSize.spaceHeight2(context),
                    // HouseholdAddressSection()
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
