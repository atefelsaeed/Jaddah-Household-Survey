import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';

class ParkThisCar extends StatefulWidget {
  const ParkThisCar({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<ParkThisCar> createState() => _ParkThisCarState();
}

class _ParkThisCarState extends State<ParkThisCar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropDownFormInput(
          label: Text(VehiclesData
              .parkThisCar[VehiclesData.parkThisCar.keys.first]!
              .toList()
              .first
              .toString()),
          hint: "أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات",
          options: VehiclesData
              .parkThisCar[VehiclesData.parkThisCar.keys.first]!
              .toList(),
          onChange: (String? p) {
            setState(() {
              VehModel.parkThisCar = p.toString();
              if (VehModel.parkThisCar != "أخر") {
                widget.textEditingController.text = VehModel.parkThisCar;
              } else {
                widget.textEditingController.text = "";
              }
            });
          },
        ),
        VehModel.parkThisCar == "Other"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextForm(
                    controller: widget.textEditingController,
                    text: "رموز نوع وقوف السيارات",
                    label: "رموز نوع وقوف السيارات",
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
