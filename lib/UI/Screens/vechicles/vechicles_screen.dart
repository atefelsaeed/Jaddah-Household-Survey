import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/fuel_type_code.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/motorisedvechiels.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/park_this_car.dart';
import 'package:jaddah_household_survey/UI/Widgets/custom_buttton.dart';

import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/text.dart';
import '../person/person_screen.dart';
import 'components/controller_vechelies_body.dart';
import 'components/owner_ship_code.dart';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppSize.spaceWidth1(context),
                        Expanded(
                          child: TextGlobal(
                            text: "المركبات في المنزل",
                            fontSize: height(context) * .023,
                            color: ColorManager.orangeTxtColor,
                          ),
                        ),
                      ],
                    ),
                    AppSize.spaceHeight3(context),
                    const MotorisedVec(),

                    const ControllerVehiclesBody(),
                    FuelTypeCode(
                      textEditingController: fuelTypeCode,
                    ),
                    AppSize.spaceHeight2(context),
                    OwnerShipCode(
                      textEditingController: ownerShipCode,
                    ),
                    AppSize.spaceHeight2(context),
                    ParkThisCar(
                      textEditingController: parkThisCar,
                    ),
                    AppSize.spaceHeight3(context),
                    AppSize.spaceHeight2(context),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                          function: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              SaveVehiclesData.saveData(context);
                              print('Saving Data :: ');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PersonScreen(),
                                ),
                              );
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
