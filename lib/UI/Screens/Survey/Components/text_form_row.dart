import 'package:flutter/cupertino.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String  label;
  final String   text;
  TextForm({super.key, required this.controller,required this.label,required this.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(children: [
          SizedBox(width: width(context)*.45,
            child:   TextGlobal(text:text, fontSize: height(context)*.02 ,color: ColorManager.black,)),
          AppSize.spaceHeight1(context),
          MyTextForm( label: label,controller: controller,),
        ],);



  }
}