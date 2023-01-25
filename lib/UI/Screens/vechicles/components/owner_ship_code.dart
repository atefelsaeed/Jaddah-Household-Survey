import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';

class OwnerShipCode extends StatefulWidget {
  const OwnerShipCode({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<OwnerShipCode> createState() => _OwnerShipCodeState();
}

class _OwnerShipCodeState extends State<OwnerShipCode> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        DropDownFormInput(
          label: Text(VehiclesData.ownership[VehiclesData.ownership.keys.first]!
              .toList()
              .first
              .toString()),
          hint: "من يملك السيارة",
          options: VehiclesData.ownership[VehiclesData.ownership.keys.first]!
              .toList(),
          onChange: (String? p) {
            setState(() {
              VehModel.ownerShipCode = p.toString();
              if (VehModel.ownerShipCode != "أخر") {
                widget.textEditingController.text = VehModel.ownerShipCode;
              }
            });
          },
        ),
        VehModel.ownerShipCode == "أخر"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextForm(
                    controller: widget.textEditingController,
                    text: "رموز الملكية",
                    label: "رموز الملكية",
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
