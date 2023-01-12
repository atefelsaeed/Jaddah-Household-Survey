import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../Survey/Components/q5.dart';

class Q2VecScreen extends StatelessWidget {

  EditingController3 editingController3;
  Q2VecScreen({super.key, required this.editingController3});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: TextGlobal(
              text: VehiclesData.q2VecData.keys.first,
              fontSize: height(context) * .017,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
      AppSize.spaceHeight2(context),
      Field(peopleAdults18: editingController3.peopleAdults18, peopleUnder18: editingController3.peopleUnder18,
          totalNumberOfVecText: "adults (18yrs +) For Work use", totalNumberOfVec: editingController3.totalNumber,
          peopleAdults18Text: "adults (18yrs +)  For Leisure", peopleUnder18Text: "children (under 18yrs)")

    ],);

  }
}