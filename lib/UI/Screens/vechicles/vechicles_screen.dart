import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/validate_data/vehicles_validation.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/vechiels_header.dart';
import 'package:jaddah_household_survey/UI/Widgets/custom_buttton.dart';

import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/text.dart';
import 'components/controller_vechelies_body.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController fuelTypeCode = TextEditingController();
  final TextEditingController ownerShipCode = TextEditingController();
  final TextEditingController parkThisCar = TextEditingController();

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
                    const VehiclesHeader(),
                    const ControllerVehiclesBody(),
                    AppSize.spaceHeight5(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                          function: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              SaveVehiclesData.saveData(context);
                              print('Saving Data :: ');
                              CheckVehiclesValidation.validate(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("يوجد خطأ بالبيانات"),
                                  duration: Duration(seconds: 3),
                                  elevation: 1,
                                ),
                              );
                            }
                          },
                          isWidget: true,
                          text: "التالي",
                          widget: const Icon(Icons.arrow_forward),
                        ),
                        AppSize.spaceWidth3(context),
                        DefaultButton(
                          function: () {
                            Navigator.pop(context);
                          },
                          isWidget: true,
                          background: ColorManager.grayColor,
                          text: "السابق",
                          widget: const Icon(Icons.arrow_back_rounded),
                        ),
                      ],
                    ),
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
