import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class MotorisedVec extends StatelessWidget {
  const MotorisedVec({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
              width: width(context) - 30,
              child: TextGlobal(
                text:
                    " 1.  كم عدد المركبات الآلية المتوفرة للأسرة للاستخدام الشخصي؟",
                fontSize: height(context) * .02,
                color: ColorManager.black,
              )),
        ),
      ],
    );
  }
}
