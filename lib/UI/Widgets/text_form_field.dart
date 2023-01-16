import 'package:flutter/material.dart';

import '../../Helper/validator.dart';
import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';

class MyTextForm extends StatelessWidget {
  final String label;
  TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? title;
  final double? widthForm;
  bool? isPassword = false;
  bool? readOnly;
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
      this.readOnly,
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
          width: widthForm ?? width(context) * .45,
          child: TextFormField(
            controller: controller,
            readOnly: readOnly ?? false,
            onTap: onTap,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: ColorManager.black,
                fontSize: height(context) * .015),
           /* validator: (String? val) => Validator.validateEmpty(
              value: val,
              message: "يجب اعطاء اجابة",
            ),*/
            decoration: InputDecoration(
              labelText: label,
              suffixIcon: suffix != null
                  ? IconButton(
                      onPressed: () {
                        suffixPressed!();
                      },
                      icon: Icon(
                        suffix,
                        color: ColorManager.gray2Color,
                        size: width(context) * .06,
                      ))
                  : null,
              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.gray2Color,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.gray2Color,
                  width: 1.0,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
            ),
            textDirection: TextDirection.ltr,
            keyboardType: keyboardType ?? TextInputType.text,
            // validator: (value) => validate!(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
