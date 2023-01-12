import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/UI/Screens/vechicles/components/vec_body_type.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
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
                      });
                    }),
                VehiclesData.vecModel[index].isChosen == true
                    ? MyTextForm(
                        textInputType: TextInputType.number,
                        widthForm: width(context) * .120,
                        controller:
                            VehiclesData.vecModel[index].textEditingController,
                        label: '',
                        onChanged: (d) {
                          setState(() {
                            switch (VehiclesData.vecModel[index].title) {
                              case "car":
                                VehModel.vecCar = [];
                                for (int i = 0; i < int.parse(d!); i++) {
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
                              case "Large Car (SUV etc.)":
                                VehModel.largeCar = [];
                                for (int i = 0; i < int.parse(d!); i++) {
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
                              case "Van":
                                VehModel.vecVan = [];
                                for (int i = 0; i < int.parse(d!); i++) {
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
                              case "E-Scooter":
                                VehModel.eScooter = [];
                                for (int i = 0; i < int.parse(d!); i++) {
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
                              case "Pick up":
                                VehModel.pickUp = [];
                                for (int i = 0; i < int.parse(d!); i++) {
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
                              case "other":
                                VehModel.other = [];
                                for (int i = 0; i < int.parse(d!); i++) {
                                  VehModel.other.add(
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
                            }
                          });

                          //   VehiclesData.vecCar.add(VecBodyType(ageOfVec: ageOfVec, annual: annual, fuel: fuel, model: model, whoOwn: whoOwn))
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
            title: "car",
          ),
        for (int i = 0; i < VehModel.vecVan.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.vecVan[i],
            index: i + 1,
            title: "Van",
          ),
        for (int i = 0; i < VehModel.largeCar.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.largeCar[i],
            index: i + 1,
            title: "large car",
          ),
        for (int i = 0; i < VehModel.pickUp.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.pickUp[i],
            index: i + 1,
            title: "pickUp",
          ),
        for (int i = 0; i < VehModel.eScooter.length; i++)
          BodyTypeVehicles(
            vecBodyType: VehModel.eScooter[i],
            index: i + 1,
            title: "Escooter",
          ),
        AppSize.spaceHeight3(context),
      ],
    );
  }
}
