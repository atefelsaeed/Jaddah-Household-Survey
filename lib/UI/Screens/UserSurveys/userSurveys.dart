import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Providers/user_surveys.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
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
    List<UserSurveysModelData> list;
    if (userSurveysProvider.isSearching) {
      print('searchList');
      list = userSurveysProvider.searchList;
      // } else if (userSurveysProvider.isSearchingQTA) {
      //   print('searchQTAList');
      //   list = userSurveysProvider.searchQTAList;
      // } else if (userSurveysProvider.isSearchingBLOK) {
      //   print('searchBLOKList');
      //   list = userSurveysProvider.searchBLOKList;
    } else {
      print('userSurveys');
      list = userSurveysProvider.userSurveys;
    }
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'رقم الحى',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              MyTextForm(
                                onChanged: (value) {
                                  userSurveysProvider.searchHAY(value!);
                                },
                                label: "بحث",

                                widthForm: width(context) * .2,
                                keyboardType: TextInputType.number,
                                isPassword: false,
                              ),
                            ],
                          ),
                          AppSize.spaceWidth3(context),
                          Column(
                            children: [
                              const Text(
                                'رقم القطاع',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              MyTextForm(
                                onChanged: (value) {
                                  userSurveysProvider.searchQTA(value!);
                                },
                                label: "بحث",
                                onTap: () {},
                                widthForm: width(context) * .2,
                                keyboardType: TextInputType.number,
                                isPassword: false,
                              ),
                            ],
                          ),
                          AppSize.spaceWidth3(context),
                          Column(
                            children: [
                              const Text(
                                'رقم البلوك',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              MyTextForm(
                                onChanged: (value) {
                                  userSurveysProvider.searchBLOK(value!);
                                },
                                label: "بحث",
                                widthForm: width(context) * .2,
                                keyboardType: TextInputType.number,
                                isPassword: false,
                              ),
                            ],
                          ),
                          AppSize.spaceWidth3(context),
                          Column(
                            children: [
                              const Text(
                                'بحث',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              Container(
                                width: width(context) * .15,
                                padding:
                                    EdgeInsets.all(AppSize.padding1(context)),
                                decoration: BoxDecoration(
                                    color: userSurveysProvider.isSearching
                                        ? ColorManager.grayColor
                                        : ColorManager.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {
                                      userSurveysProvider.changeIcon();
                                    },
                                    icon: Icon(
                                      Icons.filter_alt_outlined,
                                      color: ColorManager.wight,
                                      size: width(context) * .05,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                      AppSize.spaceHeight2(context),
                      list.isNotEmpty
                          ? Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return ItemUserSurvey(
                                      itemSurveyModel: list[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: ColorManager.grayColor,
                                  );
                                },
                                itemCount: list.length,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  'لا يوجد استبيانات',
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator())
        );
  }
}
