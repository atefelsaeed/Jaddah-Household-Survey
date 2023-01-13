import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class HouseHoldMember extends StatelessWidget {
  const HouseHoldMember({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return       Column(children: [
  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

   /* SizedBox(width: width(context)*.4,child: TextGlobal(color: ColorManager.grayColor,
      text: "This Section Could be completed with any responsible adult member of the household", fontSize:
      height(context)*.013,),),*/

    Row(mainAxisAlignment: MainAxisAlignment.end,children: [
      AppSize.spaceWidth1(context),
      Column(children: [
        CircleAvatar(backgroundColor: ColorManager.orangeTxtColor, radius: height(context)*.013),
        AppSize.spaceHeight05(context),
        Container(color: ColorManager.orangeTxtColor,width: width(context)*.03,height: height(context)*.003,)
      ],),
      AppSize.spaceWidth2(context),
      TextGlobal(text:"الجزء الأول أُسرَة", fontSize: height(context)*.023 ,color: ColorManager.black,),



    ])]),
  AppSize.spaceHeight1(context),
  const Divider(
    thickness: 1,
  ),
  AppSize.spaceHeight2(context),

],);
  }
}