import "package:collection/collection.dart";
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:jaddah_household_survey/UI/Screens/Surveies/Components/survey_tile.dart';
import 'package:jaddah_household_survey/providers/survey.dart';
import 'package:provider/provider.dart';

import '../../../../Models/survey.dart';

class SurveyList extends StatelessWidget {
  const SurveyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveysProvider p = Provider.of<SurveysProvider>(context);
    p.syncAll();
    List<Survey> surveyList = p.surveys;

    print("Survey List length: ${surveyList.length}");

    var newMap = surveyList.groupListsBy((s) => s.header.interviewDate.month).map(
          (key, value) => MapEntry(
            key,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text("Month: ${key} Number of Surveys: (${value.length})"),
            ),
          ),
        );

    FirebaseMessaging.onMessage.listen((e) async {
      p.syncAll();
      Fluttertoast.showToast(
        msg: "Syncing",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // _messageHandler(e);
    });
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 145),
          child: Card(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: surveyList.isEmpty
                      ? [const Text("You have not entered any surveys")]
                      : newMap.values.toList(),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
              width: width(context)*.7,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ChangeNotifierProvider<SurveyProvider>.value(
                      value: surveyList[index].provider,
                      child:  SurveyTile(surveyX: surveyList[index],)),
              itemCount: surveyList.length,
            ),
          ),
        ),
      ],
    );
  }
}
