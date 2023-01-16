import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/UserSurveys/itemSurveyModel.dart';
import 'package:jaddah_household_survey/UI/Widgets/connection_error.dart';
import 'package:jaddah_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../Models/user_serveys_model.dart';
import 'itemUserSurvey.dart';

class UserSurveysScreen extends StatefulWidget {
  const UserSurveysScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<UserSurveysScreen> createState() => _UserSurveysScreenState();
}

class _UserSurveysScreenState extends State<UserSurveysScreen> {
  @override
  void initState() {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    userSurveysProvider.fetch(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userSurveysProvider = Provider.of<UserSurveysProvider>(context);
    List<UserSurveysModelData> list = userSurveysProvider.isSearching
        ? userSurveysProvider.searchList
        : userSurveysProvider.userSurveys;
    return Scaffold(
        body: userSurveysProvider.loading != true
            ? SafeArea(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.subdirectory_arrow_left_rounded,
                          color: ColorManager.primaryColor,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'العودة للرئيسية',
                            style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width(context) * .045),
                          ),
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    MyTextForm(
                      onChanged: (value) {
                        userSurveysProvider.search(value!);
                      },
                      label: "بحث",
                      isPassword: false,
                      suffix: !userSurveysProvider.isSearching
                          ? Icons.search
                          : null,
                      suffixPressed: () {
                        userSurveysProvider.changeIcon();
                      },
                    ),
                    AppSize.spaceHeight2(context),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ItemUserSurvey(
                            itemSurveyModel: ItemSurveyModel(
                              numberSurvey: list[index].bLOKNO.toString(),
                              lat: list[index].pOINTX.toString(),
                              long: list[index].pOINTY.toString(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: ColorManager.grayColor,
                          );
                        },
                        itemCount: list.length,
                      ),
                    ),
                  ],
                ),
              ))
            : Center(child: CircularProgressIndicator())
        //             : const Padding(
        //                 padding: EdgeInsets.all(12.0),
        //                 child: Center(
        //                   child: Text(
        //                     'لا يوجد استبيانات',
        //                   ),
        //                 ),
        //               );
        //   }
        // }),
        );
  }
}
