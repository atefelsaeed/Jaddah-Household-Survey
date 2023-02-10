import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/vec_body_type.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/show_dialog_error.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class ControllerVehiclesBody extends StatefulWidget {
  const ControllerVehiclesBody({super.key});

  @override
  State<ControllerVehiclesBody> createState() => _ControllerVehiclesBodyState();
}

class _ControllerVehiclesBodyState extends State<ControllerVehiclesBody> {
  void showError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var total = HhsStatic.houseHold[0].totalNumberVehicles.toString();
        return ShowErrorDialog(
          title: 'يجب إدخال عدد صحيح',
          content:
              'عدد المركبات الذى أدخلته أكبر من عدد المركبات فى الأسرة ($total)!',
        );
      });

  void showVechError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var total = HhsStatic.houseHold[0].totalNumberVehicles.toString();
        return const ShowErrorDialog(
            title: 'لا يوجد لديك مركبات',
            content: "لا يوجد مركبات لدى الاسرة.");
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          AppSize.spaceHeight2(context),
          AppSize.spaceHeight1(context),
          GridView.builder(
            primary: true,
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 7,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2),
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
                            case "سيارة صغيرة":
                              VehModel.vecCar.clear();
                              break;
                            case "سيارة كبيرة  ":
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
                            case "دراجة هوائية":
                              VehModel.bicycle.clear();
                              break;
                          }
                        }
                        print(value);
                      });
                    }),
                VehiclesData.vecModel[index].isChosen == true
                    ? MyTextForm(
                        keyboardType: TextInputType.number,
                        isNumber: true,
                        widthForm: width(context) * .120,
                        controller:
                            VehiclesData.vecModel[index].textEditingController,
                        label: '',
                        onChanged: (d) {
                          print(d);
                          setState(() {
                            if (d!.isNotEmpty) {

                              switch (VehiclesData.vecModel[index].title) {
                              //================vecCar==========================
                                case "سيارة صغيرة":
                                  VehModel.vecCar = [];
                                  if (HhsStatic
                                      .houseHold[0].totalNumberVehicles
                                      .toString()
                                      .isEmpty ||
                                      HhsStatic.houseHold[0]
                                          .totalNumberVehicles
                                          .toString()
                                          .trim() ==
                                          '0') {
                                    showVechError();
                                  } else {
                                  for (int i = 0; i < int.parse(d); i++) {

                                      int x = int.parse(HhsStatic
                                          .houseHold[0].totalNumberVehicles
                                          .toString());
print(x);
                                      int total = VehModel.fuelTypeCode.length +
                                          VehModel.vecCar.length +
                                          VehModel.largeCar.length +
                                          VehModel.vecWanet.length +
                                          VehModel.vecVan.length +
                                          VehModel.pickUp.length +
                                          VehModel.eScooter.length;
                                      if (x > total) {
                                        VehModel.vecCar.add(
                                          VehicleBodyDetails(
                                            vehicleParking:
                                                TextEditingController(),
                                            vehicleOwnership:
                                                TextEditingController(),
                                            vehicleFuelType:
                                                TextEditingController(),
                                          ),
                                        );
                                      } else {
                                        showError();
                                      }
                                    }
                                  }
                                  break;
                                  //==============Large-Car====================
                                case "سيارة كبيرة  ":
                                  VehModel.largeCar = [];
                                  print(HhsStatic
                                      .houseHold[0].totalNumberVehicles
                                      .toString());

                                  for (int i = 0; i < int.parse(d); i++) {
                                    if (HhsStatic
                                            .houseHold[0].totalNumberVehicles
                                            .toString()
                                            .isEmpty ||
                                        HhsStatic.houseHold[0]
                                                .totalNumberVehicles
                                                .toString()
                                                .trim() ==
                                            '0') {
                                      showVechError();
                                    } else {
                                      int x = int.parse(HhsStatic
                                          .houseHold[0].totalNumberVehicles
                                          .toString());

                                      int total = VehModel.fuelTypeCode.length +
                                          VehModel.vecCar.length +
                                          VehModel.largeCar.length +
                                          VehModel.vecWanet.length +
                                          VehModel.vecVan.length +
                                          VehModel.pickUp.length +
                                          VehModel.eScooter.length;
                                      if (x > total) {
                                        VehModel.largeCar.add(
                                          VehicleBodyDetails(
                                            vehicleParking:
                                                TextEditingController(),
                                            vehicleOwnership:
                                                TextEditingController(),
                                            vehicleFuelType:
                                                TextEditingController(),
                                          ),
                                        );
                                      } else {
                                        showError();
                                      }
                                    }
                                  }
                                  break;
                                case "ونيت":
                                  VehModel.vecWanet = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    if (HhsStatic
                                            .houseHold[0].totalNumberVehicles
                                            .toString()
                                            .isEmpty ||
                                        HhsStatic.houseHold[0]
                                                .totalNumberVehicles
                                                .toString()
                                                .trim() ==
                                            '0') {
                                      showVechError();
                                    } else {
                                      int x = int.parse(HhsStatic
                                          .houseHold[0].totalNumberVehicles
                                          .toString());

                                      int total = VehModel.fuelTypeCode.length +
                                          VehModel.vecCar.length +
                                          VehModel.largeCar.length +
                                          VehModel.vecWanet.length +
                                          VehModel.vecVan.length +
                                          VehModel.pickUp.length +
                                          VehModel.eScooter.length;
                                      if (x > total) {
                                        VehModel.vecWanet.add(
                                          VehicleBodyDetails(
                                            vehicleParking:
                                                TextEditingController(),
                                            vehicleOwnership:
                                                TextEditingController(),
                                            vehicleFuelType:
                                                TextEditingController(),
                                          ),
                                        );
                                      } else {
                                        showError();
                                      }
                                    }
                                  }
                                  break;
                                case "شاحنة":
                                  VehModel.vecVan = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    if (HhsStatic
                                            .houseHold[0].totalNumberVehicles
                                            .toString()
                                            .isEmpty ||
                                        HhsStatic.houseHold[0]
                                                .totalNumberVehicles
                                                .toString()
                                                .trim() ==
                                            '0') {
                                      showVechError();
                                    } else {
                                      int x = int.parse(HhsStatic
                                          .houseHold[0].totalNumberVehicles
                                          .toString()
                                          .trim());
                                      int total = VehModel.fuelTypeCode.length +
                                          VehModel.vecCar.length +
                                          VehModel.largeCar.length +
                                          VehModel.vecWanet.length +
                                          VehModel.vecVan.length +
                                          VehModel.pickUp.length +
                                          VehModel.eScooter.length;

                                      if (x > total) {
                                        VehModel.vecVan.add(
                                          VehicleBodyDetails(
                                            vehicleParking:
                                                TextEditingController(),
                                            vehicleOwnership:
                                                TextEditingController(),
                                            vehicleFuelType:
                                                TextEditingController(),
                                          ),
                                        );
                                      } else {
                                        showError();
                                      }
                                    }
                                  }
                                  break;
                                case "دراجة نارية":
                                  VehModel.pickUp = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    if (HhsStatic
                                            .houseHold[0].totalNumberVehicles
                                            .toString()
                                            .isEmpty ||
                                        HhsStatic.houseHold[0]
                                                .totalNumberVehicles
                                                .toString()
                                                .trim() ==
                                            '0') {
                                      showVechError();
                                    } else {
                                      int x = int.parse(HhsStatic
                                          .houseHold[0].totalNumberVehicles
                                          .toString());

                                      int total = VehModel.fuelTypeCode.length +
                                          VehModel.vecCar.length +
                                          VehModel.largeCar.length +
                                          VehModel.vecWanet.length +
                                          VehModel.vecVan.length +
                                          VehModel.pickUp.length +
                                          VehModel.eScooter.length;
                                      if (x > total) {
                                        VehModel.pickUp.add(
                                          VehicleBodyDetails(
                                            vehicleParking:
                                                TextEditingController(),
                                            vehicleOwnership:
                                                TextEditingController(),
                                            vehicleFuelType:
                                                TextEditingController(),
                                          ),
                                        );
                                      } else {
                                        showError();
                                      }
                                    }
                                  }
                                  break;
                                case "دراجة هوائية":
                                  VehModel.bicycle = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    if (HhsStatic
                                            .houseHold[0].totalNumberVehicles
                                            .toString()
                                            .isEmpty ||
                                        HhsStatic.houseHold[0]
                                                .totalNumberVehicles
                                                .toString()
                                                .trim() ==
                                            '0') {
                                      showVechError();
                                    } else {
                                      int x = int.parse(HhsStatic
                                          .houseHold[0].totalNumberVehicles
                                          .toString());

                                      int total = VehModel.fuelTypeCode.length +
                                          VehModel.vecCar.length +
                                          VehModel.largeCar.length +
                                          VehModel.vecWanet.length +
                                          VehModel.vecVan.length +
                                          VehModel.pickUp.length +
                                          VehModel.eScooter.length;
                                      if (x > total) {
                                        VehModel.bicycle.add(
                                          VehicleBodyDetails(
                                            vehicleParking:
                                                TextEditingController(),
                                            vehicleOwnership:
                                                TextEditingController(),
                                            vehicleFuelType:
                                                TextEditingController(),
                                          ),
                                        );
                                      } else {
                                        showError();
                                      }
                                    }
                                  }
                                  break;
                                case " اسكوتر":
                                  VehModel.eScooter = [];
                                  for (int i = 0; i < int.parse(d); i++) {
                                    if (HhsStatic
                                            .houseHold[0].totalNumberVehicles
                                            .toString()
                                            .isEmpty ||
                                        HhsStatic.houseHold[0]
                                                .totalNumberVehicles
                                                .toString()
                                                .trim() ==
                                            '0') {
                                      showVechError();
                                    } else {
                                      int x = int.parse(HhsStatic
                                          .houseHold[0].totalNumberVehicles
                                          .toString());

                                      int total = VehModel.fuelTypeCode.length +
                                          VehModel.vecCar.length +
                                          VehModel.largeCar.length +
                                          VehModel.vecWanet.length +
                                          VehModel.vecVan.length +
                                          VehModel.pickUp.length +
                                          VehModel.eScooter.length;
                                      if (x > total) {
                                        VehModel.eScooter.add(
                                          VehicleBodyDetails(
                                            vehicleParking:
                                                TextEditingController(),
                                            vehicleOwnership:
                                                TextEditingController(),
                                            vehicleFuelType:
                                                TextEditingController(),
                                          ),
                                        );
                                      } else {
                                        showError();
                                      }
                                    }
                                  }
                                  break;
                              }
                            } else {
                              switch (VehiclesData.vecModel[index].title) {
                                case "سيارة صغيرة":
                                  VehModel.vecCar.clear();
                                  break;
                                case "شاحنة":
                                  VehModel.vecVan.clear();
                                  break;
                                case "ونيت":
                                  VehModel.vecWanet.clear();
                                  break;
                                case "سيارة كبيرة  ":
                                  VehModel.largeCar.clear();
                                  break;
                                case "دراجة نارية":
                                  VehModel.pickUp.clear();
                                  break;
                                case "دراجة هوائية":
                                  VehModel.bicycle.clear();
                                  break;
                                case " اسكوتر":
                                  VehModel.eScooter.clear();
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
          //===========vecCar=============================
          for (int i = 0; i < VehModel.vecCar.length; i++)
            BodyTypeVehicles(
              vecBodyType: VehModel.vecCar[i],
              index: i + 1,
              title: "سيارة صغيرة",
              function: () {
                setState(() {
                  VehModel.vecCar.removeAt(i);
                  VehiclesData.vecModel[0].textEditingController.text =
                      VehModel.vecCar.length.toString();
                });
              },
            ),
          //===========vecVan=============================
          for (int i = 0; i < VehModel.vecVan.length; i++)
            BodyTypeVehicles(
              vecBodyType: VehModel.vecVan[i],
              index: i + 1,
              title: "شاحنة",
              function: () {
                setState(() {
                  VehModel.vecVan.removeAt(i);
                  VehiclesData.vecModel[3].textEditingController.text =
                      VehModel.vecVan.length.toString();
                });
              },
            ),
          //===========vecWanet=============================
          for (int i = 0; i < VehModel.vecWanet.length; i++)
            BodyTypeVehicles(
              vecBodyType: VehModel.vecWanet[i],
              index: i + 1,
              title: "ونيت",
              function: () {
                setState(() {
                  VehModel.vecWanet.removeAt(i);
                  VehiclesData.vecModel[2].textEditingController.text =
                      VehModel.vecWanet.length.toString();
                });
              },
            ),
          //===========largeCar=============================
          for (int i = 0; i < VehModel.largeCar.length; i++)
            BodyTypeVehicles(
              vecBodyType: VehModel.largeCar[i],
              index: i + 1,
              title: "سيارة كبيرة",
              function: () {
                setState(() {
                  VehModel.largeCar.removeAt(i);
                  VehiclesData.vecModel[1].textEditingController.text =
                      VehModel.largeCar.length.toString();
                });
              },
            ),
          //===========pickUp=============================
          for (int i = 0; i < VehModel.pickUp.length; i++)
            BodyTypeVehicles(
              vecBodyType: VehModel.pickUp[i],
              index: i + 1,
              title: "دراجة نارية",
              function: () {
                setState(() {
                  VehModel.pickUp.removeAt(i);
                  VehiclesData.vecModel[4].textEditingController.text =
                      VehModel.pickUp.length.toString();
                });
              },
            ),
          //===========bicycle=============================
          for (int i = 0; i < VehModel.bicycle.length; i++)
            BodyTypeVehicles(
              vecBodyType: VehModel.bicycle[i],
              index: i + 1,
              title: "دراجة هوائية",
              function: () {
                setState(() {
                  VehModel.bicycle.removeAt(i);
                  VehiclesData.vecModel[5].textEditingController.text =
                      VehModel.bicycle.length.toString();
                });
              },
            ),
          //===========eScooter=============================
          for (int i = 0; i < VehModel.eScooter.length; i++)
            BodyTypeVehicles(
              vecBodyType: VehModel.eScooter[i],
              index: i + 1,
              title: "سكوتر الكترونى",
              function: () {
                setState(() {
                  VehModel.eScooter.removeAt(i);
                  VehiclesData.vecModel[6].textEditingController.text =
                      VehModel.eScooter.length.toString();
                });
              },
            ),
          AppSize.spaceHeight3(context),
        ],
      ),
    );
  }
}
