import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Helper/validator.dart';
import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';

class MyTextForm extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? title;
  final double?widthForm;
  bool? isPassword = false;
  IconData? suffix;
  final Function? suffixPressed;
  String? Function()? validate;
  Function()? onTap;
  Function(String?)? onChanged;
  Iterable<String>? autofillHints;
  String? errorText;
  final Widget? prefixIcon;

  MyTextForm(
      {this.controller,
        Key? key,
        this.errorText,
        this.validate,
        this.keyboardType,
        this.title,
        this.widthForm,
        this.suffixPressed,
        this.isPassword,
        this.suffix,
        this.prefixIcon,
        this.onTap,
        this.onChanged,
        this.autofillHints,
        required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width:widthForm?? width(context)*.45,
          child:  TextFormField(
            controller: controller,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color:ColorManager.black,
                fontSize: height(context)*.015),

            decoration:  InputDecoration(labelText: label,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.gray2Color,
                  width: 1.0,
                ),
              ),),
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.text,
            validator: (value)=>validate!(),

          ),
        ),
      ],
    );
  }
}