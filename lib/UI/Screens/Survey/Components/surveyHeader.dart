import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Helper/validator.dart';
import '../../../../Resources/assets_manager.dart';

class SurveyHeader extends StatelessWidget {
  SurveyHeader({Key? key}) : super(key: key);
  DateTime interviewDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Jeddah Model - Household Travel Diary Survey'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Image(image: AssetImage(ImageAssets.logo)),
            Image(image: AssetImage(ImageAssets.logo)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Interview number: #12'),
            Text('Interview day: $interviewDay')
          ],
        ),
        Row(
          children: [
            Text('District Name:'),
            TextField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (String s) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(""),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              keyboardType: TextInputType.text,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.allow(
              //     RegExp(r'[0-9]'),
              //   ),
              // ],
              // validator: (String? s) => Validator.validateEmpty(
              //   value: s,
              //   message: "يجب اعطاء اجابة",
              // ),
            ),
          ],
        )
      ],
    );
  }
}
