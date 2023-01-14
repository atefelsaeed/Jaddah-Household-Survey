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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropDownFormInput(
          label: Text(VehiclesData.ownership[VehiclesData.ownership.keys.first]!
              .toList()
              .first
              .toString()),
          hint: "رموز الملكية",
          options: VehiclesData.ownership[VehiclesData.ownership.keys.first]!
              .toList(),
          onChange: (String? p) {
            setState(() {
              VehModel.ownerShipCode = p.toString();
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
