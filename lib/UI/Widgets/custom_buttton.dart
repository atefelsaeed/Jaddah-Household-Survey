// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';

import '../../Resources/sizes.dart';

class DefaultButton extends StatelessWidget {
  Color? background;
  Color? textColor;

  bool isWidget = true;
  double? radius;

  double? btnWidth;
  double? btnHeight;

  final Function function;
  String? text;
  Widget? widget;
  double? fontSize;
  FontWeight? fontWeight;

  DefaultButton(
      {Key? key,
      required this.function,
      this.text,
      this.background,
      this.btnWidth,
      this.textColor,
      required this.isWidget,
      this.fontSize,
      this.fontWeight,
      this.radius,
      this.btnHeight,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight ?? height(context) * .06,
      width: btnWidth ?? width(context) * .25,
      decoration: BoxDecoration(
          color: background ?? ColorManager.orangeTxtColor,
          borderRadius: BorderRadius.circular(
            radius ?? 10.0,
          )),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text!,
          style: TextStyle(
            color: textColor ?? ColorManager.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: width(context) * .036,
          ),
        ),
      ),
    );
  }
}

// class OutLinedButton extends ButtonStyleButton {
//   const OutLinedButton(
//       {super.key,
//       super.style,
//       super.child,
//       super.focusNode,
//       required super.autofocus,
//       required super.clipBehavior,
//       super.onFocusChange,
//       super.onHover,
//       super.onLongPress,
//       super.onPressed,
//       super.statesController});
//
//   @override
//   ButtonStyle defaultStyleOf(BuildContext context) {
//     // TODO: implement defaultStyleOf
//     throw UnimplementedError();
//   }
//
//   @override
//   ButtonStyle? themeStyleOf(BuildContext context) {
//     // TODO: implement themeStyleOf
//     throw UnimplementedError();
//   }
// }
