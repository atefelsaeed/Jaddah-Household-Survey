import 'package:flutter/cupertino.dart';

import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';

class TextGlobal extends StatelessWidget {
 final  String text;
 final double fontSize;
 final Color color;
 const TextGlobal({super.key, required this.text,required this.fontSize,required this.color});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
   text,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          color:color,
          fontSize: fontSize,
      ),
      textAlign: TextAlign.left,
    );
  }
}