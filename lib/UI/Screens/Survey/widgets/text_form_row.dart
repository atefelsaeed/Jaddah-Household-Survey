import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/Resources/font_manager.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String  label;
  final double? fontSize;
  final String   text;
  const TextForm({super.key, required this.controller,required this.label,required this.text, this.fontSize});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(children: [
          SizedBox(width: width(context)*.45,
            child:   TextGlobal(text:text, fontSize:fontSize?? height(context)*.02 ,color: ColorManager.black,)),
          AppSize.spaceHeight1(context),
          MyTextForm( label: label,controller: controller,),
        ],);
  }
}


class TextFormer extends StatelessWidget {
  final TextEditingController controller;
  final String  label;
  final String headLabel;
  final String   text;
  const TextFormer({super.key, required this.controller,required this.label,required this.text,required this.headLabel});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      SizedBox(width: width(context)*.45,child: Row(children: [
          TextGlobal(text:headLabel, fontSize: height(context)*.017 ,color: ColorManager.orangeTxtColor,),
             TextGlobal(text:text, fontSize: height(context)*.017 ,color: ColorManager.black,)
      ],)),
      AppSize.spaceHeight1(context),
      MyTextForm( label: label,controller: controller,),
    ],);



  }
}