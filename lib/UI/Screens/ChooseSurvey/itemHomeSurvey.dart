import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:provider/provider.dart';

import '../../../Providers/auth.dart';
import '../../../Providers/surveys.dart';
import '../../../Providers/user_surveys.dart';

class ItemHomeSurvey extends StatefulWidget {
  const ItemHomeSurvey({Key? key, required this.count}) : super(key: key);
  final int count;

  @override
  State<ItemHomeSurvey> createState() => _ItemHomeSurveyState();
}

class _ItemHomeSurveyState extends State<ItemHomeSurvey> {
  late final subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserSurveysProvider userSurveysProvider =
    Provider.of<UserSurveysProvider>(context, listen: false);
    Auth auth = Provider.of<Auth>(context, listen: false);
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          setState(() {
            print('connectivity');

            SurveysProvider p =
                Provider.of<SurveysProvider>(context, listen: false);
            p.syncAll();
            userSurveysProvider.fetchUserSurveysStatus(auth.user!.id);
            // FirebaseMessaging.onMessage.listen((e) async {
            //   p.syncAll();
            //   print('sync message');
            //   // ignore: curly_braces_in_flow_control_structures
            //   Fluttertoast.showToast(
            //     msg: "Syncing",
            //     toastLength: Toast.LENGTH_SHORT,
            //     gravity: ToastGravity.BOTTOM,
            //     timeInSecForIosWeb: 1,
            //     backgroundColor: Colors.green,
            //     textColor: Colors.white,
            //     fontSize: 16.0,
            //   );
            //   // _messageHandler(e);
            // });
          });
        }
        // Got a new connectivity status!
      },
    );
    userSurveysProvider.fetchUserSurveysStatus(auth.user!.id);
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSurveysProvider>(
      builder: (context, model, _) => model.loading == true
          ? Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            )
          : Card(
              margin: EdgeInsets.symmetric(
                  horizontal: width(context) * .1,
                  vertical: height(context) * .03),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مسح يوميات الذهاب المنزلي',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    AppSize.spaceHeight5(context),

                    Row(
                      children: [
                        const Image(
                            image: AssetImage(
                          ImageAssets.iconLambGray,
                        )),
                        AppSize.spaceWidth2(context),
                        Text('عدد المنجز',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: ColorManager.grayColor,
                            )),
                        const Spacer(),
                        Text(
                          model.userSurveyStatusData?.formFilled.toString() ??
                              '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    Row(
                      children: [
                        const Image(
                            image: AssetImage(
                          ImageAssets.iconLambGray,
                        )),
                        AppSize.spaceWidth2(context),
                        Text('عدد الغير منجز',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: ColorManager.grayColor,
                            )),
                        const Spacer(),
                        Text(
                          model.userSurveyStatusData?.formNotFilled
                                  .toString() ??
                              '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1.5),
                    Row(
                      children: [
                        const Image(
                            image: AssetImage(
                          ImageAssets.iconLambGray,
                        )),
                        AppSize.spaceWidth2(context),
                        Text('الإجمالى',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: ColorManager.grayColor,
                            )),
                        const Spacer(),
                        Text(
                          model.userSurveyStatusData?.allForms.toString() ??
                              '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Image(
                    //         image: AssetImage(
                    //           ImageAssets.iconLambGray,
                    //         )),
                    //     AppSize.spaceWidth2(context),
                    //     Text('عدد الاستبيانات',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w800,
                    //           color: ColorManager.grayColor,
                    //         )),
                    //     const Spacer(),
                    //     Text(
                    //       count.toString(),
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w800,
                    //         color: ColorManager.primaryColor,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
