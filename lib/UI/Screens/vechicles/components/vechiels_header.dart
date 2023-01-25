import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class VehiclesHeader extends StatelessWidget {
  const VehiclesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        TextGlobal(
          text: " 1.  كم عدد المركبات الآلية المتوفرة للأسرة للاستخدام الشخصي؟",
          fontSize: height(context) * .02,
          color: ColorManager.black,
        ),
      ],
    );
  }
}
