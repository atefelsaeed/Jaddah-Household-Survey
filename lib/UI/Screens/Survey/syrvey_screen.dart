import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/HouseholdPart1/empty_data/empty_hhs.dart';
import 'package:jaddah_household_survey/Data/app_constants.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q1.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q10.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/hhs_Q2.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/house_hold_address.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/action_button.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/components/qh9.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/editing_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/user_serveys_model.dart';
import '../../../Providers/user_surveys.dart';
import '../../Widgets/exit_screen.dart';
import '../../Widgets/item_text_span.dart';
import '../vechicles/components/nearest_transporter.dart';
import 'Components/hhs_Q5.dart';
import 'Components/hhs_Q81.dart';
import 'Components/hhs_Q82.dart';
import 'Components/hhs_Q83.dart';
import 'Components/hhs_header.dart';
import 'actions/action_survey_screen.dart';
import 'components/demolished_area.dart';
import 'components/hhs_Q4.dart';
import 'components/hhs_q6.dart';
import 'components/hhs_qh4.dart';
import 'components/hhs_qh62.dart';

class SurveyScreen extends StatefulWidget {
   SurveyScreen({
    super.key,
    required this.itemSurveyModel,
  });

   UserSurveysModelData itemSurveyModel;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  EditingController editingController = EditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   //  //Reset-to-empty-data
   //  EmptyHHS.resetHHS(context);
   //
   //  ///reset-values-for-editing
   //  //init();
   //
   //  final validationService =
   //  Provider.of<ActionSurveyProvider>(context, listen: false);
   //
   //  int id = widget.itemSurveyModel.id!;
   //  validationService.resetHHSValues(editingController, context, id);
   // // check-if-edit-or-new-survey
   //  if ((widget.itemSurveyModel.status == 'edit' &&
   //      AppConstants.isResetHHS == true)) {
   //    print('first edit');
   //  }
    //Reset-to-empty-data
    EmptyHHS.resetHHS(context);

    ///reset-values-for-editing
    final validationService =
    Provider.of<ActionSurveyProvider>(context, listen: false);
    //check-if-edit-or-new-survey
    if ((widget.itemSurveyModel.status == 'edit' &&
        AppConstants.isResetHHS == true)) {
      print('first edit');
      int id = widget.itemSurveyModel.id!;
      validationService.resetHHSValues(editingController, context, id);
    }
  }

  init() async {
await     saveUpdateUser();
  }

  saveUpdateUser() async {
    final prefs = await SharedPreferences.getInstance();
  prefs.getString(
      "UserSurveysModelData",
 );
  print(prefs.get("UserSurveysModelData"));
  String? data= prefs.getString("UserSurveysModelData");

    Map<String, dynamic> valueMap = json.decode(data!);
    print(valueMap);
widget.itemSurveyModel=UserSurveysModelData.fromJson(valueMap);
print(UserSurveysModelData.fromJson(valueMap));
print( widget.itemSurveyModel.id);
    final validationService =
    Provider.of<ActionSurveyProvider>(context, listen: false);
    int? id = widget.itemSurveyModel.id;
    print(id);
    //validationService.resetHHSValues(editingController, context, id!);

  }

  @override
  Widget build(BuildContext context) {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () {
        return OnExitScreen.onWillPop(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _key,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Consumer<ActionSurveyProvider>(
                        builder: (context, provider, child) {
                      return Column(
                        children: [
                          const HHSHeader(),
                          userSurveysProvider.loading
                              ? SizedBox(
                                  height: height(context) * .5,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorManager.primaryColor,
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    // ===== HouseHoldAddress ===
                                    HouseHoldAddress(
                                      itemSurveyModel: widget.itemSurveyModel,
                                    ),
                                    AppSize.spaceHeight3(context),
                                    const HouseHoldMember(),
                                    Divider(thickness: 2,height: height(context)*.06,),
                                    // ====Question 1====
                                    const HHSQ1(),
                                    Divider(thickness: 2,height: height(context)*.06,),
                                    //
                                    // ====Question 2====
                                    const HHSQ2(),
                                    // ====Question 3====
                                    AppSize.spaceHeight3(context),
                                    HHsQh4(
                                      editingController: editingController,
                                    ),
                                    // ====Question 4====
                                    HHSQ4(
                                      q6peopleAdults18:
                                          editingController.q6peopleAdults18,
                                      q6peopleUnder18:
                                          editingController.q6peopleUnder18,
                                      q6totalNumberOfVec:
                                          editingController.q6totalNumberOfVec,
                                    ),
                                    AppSize.spaceHeight2(context),

                                    // ====Question 5====
                                    HHSQ5(
                                      editingController: editingController,
                                      peopleAdults18:
                                          editingController.peopleAdults18,
                                      peopleUnder18:
                                          editingController.peopleUnder18,
                                    ),
                                    AppSize.spaceHeight3(context),
                                    // ====Question 6====
                                    const HHsQ6(),
                                    // ====Question 7====
                                    HHSQH62(editingController),
                                    DemolishedArea(editingController),
                                    AppSize.spaceHeight5(context),
                                    HHSQ81(
                                        editingController3: editingController
                                            .editingController3Q81),
                                    AppSize.spaceHeight3(context),
                                    HHSQ82(
                                        editingController3: editingController
                                            .editingController3Q82),
                                    AppSize.spaceHeight3(context),
                                    HHSQ83(
                                        editingController3: editingController
                                            .editingController3Q83),
                                    AppSize.spaceHeight2(context),
                                    const MyDivider(),

                                    const QH9(),
                                    AppSize.spaceHeight3(context),
                                    //========HHSQ9=================
                                    const NearestTransporter(),
                                    //========HHSQ10=================
                                    const HHSQ10(),
                                    ActionButton(
                                      editingController: editingController,
                                      keyVal: _key,
                                      id: widget.itemSurveyModel.id?.toString()??'1',
                                    ),
                                  ],
                                )
                        ],
                      );
                    })),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
