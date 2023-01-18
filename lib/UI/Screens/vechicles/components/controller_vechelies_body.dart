import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/vec_body_type.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class ControllerVehiclesBody extends StatefulWidget {
  const ControllerVehiclesBody({super.key});

  @override
  State<ControllerVehiclesBody> createState() => _ControllerVehiclesBodyState();
}

class _ControllerVehiclesBodyState extends State<ControllerVehiclesBody> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight1(context),
        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: GridView.builder(
            primary: true,
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 4),
            itemBuilder: (context, index) => SizedBox(
              width: width(context) / 2,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: TextGlobal(
                    text: VehiclesData.vecModel[index].title,
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
                    value: VehiclesData.vecModel[index].isChosen,
                    onChanged: (bool? value) {
                      setState(() {
                        VehiclesData.vecModel[index].isChosen = value!;
                        if (VehiclesData.vecModel[index].isChosen == false) {
                          VehiclesData.vecModel[index].textEditingController
                              .text = 0.toString();
                        }
                        if (value == false) {
                          switch (VehiclesData.vecModel[index].title) {
                            case "سيارة":
                              VehModel.vecCar.clear();
                              break;
                            case "سيارة كبيرة (SUV وما إلى ذلك)":
                              VehModel.largeCar.clear();
                              break;
                            case "شاحنة":
                              VehModel.vecVan.clear();
                              break;
                            case " اسكوتر":
                              VehModel.eScooter.clear();
                              break;
                            case "ونيت":
                              VehModel.vecWanet.clear();
                              break;
                            case "دراجة نارية":
                              VehModel.pickUp.clear();
                              break;
                          }
                        }
                        print(value);
                      });
                    }),
                VehiclesData.vecModel[index].isChosen == true
                    ? MyTextForm(
                        keyboardType: TextInputType.number,
                        widthForm: width(context) * .120,
                        controller:
                            VehiclesData.vecModel[index].textEditingController,
                        label: '',
                        onChanged: (d) {
                          print(d);
                          setState(() {
                            if (d!.isNotEmpty) {
                              switch (VehiclesData.vecModel[index].title) {
                                case "سيارة":
                                  print("object");
                                  VehModel.vecCar = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    VehModel.vecCar.add(
                                      VehicleBodyDetails(
                                        vehicleModel: TextEditingController(),
                                        vehicleOwner: TextEditingController(),
                                        vehicleAge: TextEditingController(),
                                        vehicleAnnualMileage:
                                            TextEditingController(),
                                        vehicleFuel: TextEditingController(),
                                      ),
                                    );
                                  }
                                  break;
                                case "سيارة كبيرة (SUV وما إلى ذلك)":
                                  VehModel.largeCar = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    VehModel.largeCar.add(
                                      VehicleBodyDetails(
                                        vehicleModel: TextEditingController(),
                                        vehicleOwner: TextEditingController(),
                                        vehicleAge: TextEditingController(),
                                        vehicleAnnualMileage:
                                            TextEditingController(),
                                        vehicleFuel: TextEditingController(),
                                      ),
                                    );
                                  }
                                  break;
                                case "ونيت":
                                  VehModel.vecWanet = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    VehModel.vecWanet.add(
                                      VehicleBodyDetails(
                                        vehicleModel: TextEditingController(),
                                        vehicleOwner: TextEditingController(),
                                        vehicleAge: TextEditingController(),
                                        vehicleAnnualMileage:
                                            TextEditingController(),
                                        vehicleFuel: TextEditingController(),
                                      ),
                                    );
                                  }
                                  break;
                                case "شاحنة":
                                  VehModel.vecVan = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    VehModel.vecVan.add(
                                      VehicleBodyDetails(
                                        vehicleModel: TextEditingController(),
                                        vehicleOwner: TextEditingController(),
                                        vehicleAge: TextEditingController(),
                                        vehicleAnnualMileage:
                                            TextEditingController(),
                                        vehicleFuel: TextEditingController(),
                                      ),
                                    );
                                  }
                                  break;
                                case "دراجة نارية":
                                  VehModel.pickUp = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    VehModel.pickUp.add(
                                      VehicleBodyDetails(
                                        vehicleModel: TextEditingController(),
                                        vehicleOwner: TextEditingController(),
                                        vehicleAge: TextEditingController(),
                                        vehicleAnnualMileage:
                                            TextEditingController(),
                                        vehicleFuel: TextEditingController(),
                                      ),
                                    );
                                  }
                                  break;
                                case " اسكوتر":
                                  VehModel.eScooter = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    VehModel.eScooter.add(
                                      VehicleBodyDetails(
                                        vehicleModel: TextEditingController(),
                                        vehicleOwner: TextEditingController(),
                                        vehicleAge: TextEditingController(),
                                        vehicleAnnualMileage:
                                            TextEditingController(),
                                        vehicleFuel: TextEditingController(),
                                      ),
                                    );
                                  }
                                  break;
                                // case "other":
                                //   VehModel.vecWanet = [];
                                //   for (int i = 0; i < int.parse(d); i++) {
                                //     VehModel.vecWanet.add(
                                //       VehicleBodyDetails(
                                //         vehicleModel: TextEditingController(),
                                //         vehicleOwner: TextEditingController(),
                                //         vehicleAge: TextEditingController(),
                                //         vehicleAnnualMileage:
                                //             TextEditingController(),
                                //         vehicleFuel: TextEditingController(),
                                //       ),
                                //     );
                                //   }
                                //   break;
                              }
                            } else {
                              switch (VehiclesData.vecModel[index].title) {
                                case "سيارة":
                                  VehModel.vecCar.clear();
                                  break;
                                case "سيارة كبيرة (SUV وما إلى ذلك)":
                                  VehModel.largeCar.clear();
                                  break;
                                case "شاحنة":
                                  VehModel.vecVan.clear();
                                  break;
                                case " اسكوتر":
                                  VehModel.eScooter.clear();
                                  break;
                                case "ونيت":
                                  VehModel.vecWanet.clear();
                                  break;
                                case "دراجة نارية":
                                  VehModel.pickUp.clear();
                                  break;
                              }
                            }
                          });
                        },
                        onTap: () {},
                      )
                    : Container(),
              ]),
            ),
          ),
        ),
        for (int i = 0; i < VehModel.vecCar.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.vecCar[i],
            index: i + 1,
            title: "سيارة",
            function: () {
              setState(() {
                VehModel.vecCar.removeAt(i);
              });
            },
          ),
        for (int i = 0; i < VehModel.vecVan.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.vecVan[i],
            index: i + 1,
            title: "شاحنة",
            function: () {
              setState(() {
                VehModel.vecVan.removeAt(i);
              });
            },
          ),
        for (int i = 0; i < VehModel.largeCar.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.largeCar[i],
            index: i + 1,
            title: "سيارة كبيرة",
            function: () {
              setState(() {
                VehModel.largeCar.removeAt(i);
              });
            },
          ),
        for (int i = 0; i < VehModel.pickUp.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.pickUp[i],
            index: i + 1,
            title: "دراجة نارية",
            function: () {
              setState(() {
                VehModel.pickUp.removeAt(i);
              });
            },
          ),
        for (int i = 0; i < VehModel.eScooter.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.eScooter[i],
            index: i + 1,
            title: "سكوتر الكترونى",
            function: () {
              setState(() {
                VehModel.eScooter.removeAt(i);
              });
            },
          ),
        for (int i = 0; i < VehModel.vecWanet.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.vecWanet[i],
            index: i + 1,
            title: "ونيت",
            function: () {
              setState(() {
                VehModel.vecWanet.removeAt(i);
              });
            },
          ),
        AppSize.spaceHeight3(context),
      ],
    );
  }
}
