// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
// import 'package:jaddah_household_survey/Providers/surveys.dart';
// import 'package:jaddah_household_survey/Resources/assets_manager.dart';
// import 'package:jaddah_household_survey/Resources/colors.dart';
// import 'package:jaddah_household_survey/Resources/sizes.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../Models/survey.dart';
//
// class SurveyTile extends StatefulWidget {
//   const SurveyTile({
//     Key? key,
//     required this.surveyX,
//   }) : super(key: key);
//   final Survey surveyX;
//
//   @override
//   State<SurveyTile> createState() => _SurveyTileState();
// }
//
// class _SurveyTileState extends State<SurveyTile> {
//   late final subscription;
//
//   @override
//   initState() {
//     super.initState();
//
//     subscription = Connectivity().onConnectivityChanged.listen(
//       (ConnectivityResult result) {
//         if (result == ConnectivityResult.mobile ||
//             result == ConnectivityResult.wifi) setState(() {});
//         // Got a new connectivity status!
//       },
//     );
//   }
//
// // Be sure to cancel subscription after you are done
//   @override
//   dispose() {
//     super.dispose();
//
//     subscription.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final survey = Provider.of<SurveyPTProvider>(context, listen: true);
//     final SurveysProvider surveys =
//         Provider.of<SurveysProvider>(context, listen: false);
//     // print('location');
//     // print(survey.headerLong);
//     return Card(
//       margin: EdgeInsets.only(bottom: height(context)*.05),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Household Travel Diary Survey',
//               style: TextStyle(fontWeight: FontWeight.w800),
//             ),
//             AppSize.spaceHeight5(context),
//             Row(
//               children: [
//                 const Image(
//                     image: AssetImage(
//                   ImageAssets.iconLambGray,
//                 )),
//                 AppSize.spaceWidth2(context),
//                 Text('Number of survey',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w800,
//                       color: ColorManager.grayColor,
//                     )),
//                 const Spacer(),
//                 Text(
//                   '${widget.surveyX.header.interviewNumber}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w800,
//                     color: ColorManager.primaryColor,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//         // trailing: Consumer<SurveyPTProvider>(
//         //   builder: (ctx, s, b) => !s.synced
//         //       ? CircleAvatar(
//         //           radius: 30,
//         //           child: s.syncing
//         //               ? const CircularProgressIndicator(
//         //                   color: Colors.white,
//         //                 )
//         //               : IconButton(
//         //                   onPressed: () {
//         //                     s.sync(callback: surveys.save);
//         //                   },
//         //                   icon: const Icon(Icons.sync),
//         //                   color: Colors.white,
//         //                 ),
//         //         )
//         //       : const SizedBox.shrink(),
//         // ),
//       ),
//     );
//   }
// }
