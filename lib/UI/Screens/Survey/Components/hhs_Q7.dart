import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/widgets/text_form_row.dart';
import 'package:jaddah_household_survey/UI/Widgets/text.dart';

class ListQ7 extends StatefulWidget {
  final String title;
  final String subTitle;
  List<dynamic> question;
  final TextEditingController textEditingController;

  ListQ7(
      {super.key,
      required this.title,
      required this.question,
      required this.subTitle,
      required this.textEditingController});

  @override
  State<ListQ7> createState() => _ListQ7();
}

class _ListQ7 extends State<ListQ7> {
  int chosenIndex = 0;
  bool indexBool = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextGlobal(
              text: widget.title,
              fontSize: height(context) * .02,
              color: ColorManager.black,
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: width(context) - 140,
              child: TextGlobal(
                text: widget.subTitle,
                fontSize: height(context) * .013,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
              height: height(context) * .04,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.question.length,
                itemBuilder: (BuildContext context, int index) =>
                    Row(children: [
                  TextGlobal(
                    text: widget.question[index]["value"],
                    fontSize: height(context) * .02,
                    color: ColorManager.grayColor,
                  ),
                  Checkbox(
                      side: BorderSide(
                        color: ColorManager.orangeTxtColor,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      checkColor: ColorManager.whiteColor,
                      focusColor: ColorManager.orangeTxtColor,
                      activeColor: ColorManager.orangeTxtColor,
                      value: widget.question[index]["isChick"],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.question[chosenIndex]["isChick"] = false;
                          chosenIndex = index;
                          widget.question[index]["isChick"] = value;
                          //  w
                        });
                      }),
                ]),
              )),
        ),
        widget.question[chosenIndex]["isChick"] =
            true && widget.question[chosenIndex]["value"] == true
                ? TextForm(
                    controller: widget.textEditingController,
                    label: 'Name of the demolished area',
                    text: 'Name of the demolished area',
                  )
                : Container()
      ],
    );
  }
}
