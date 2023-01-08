import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:jaddah_household_survey/UI/Screens/Surveies/Components/survey_tile.dart';
import 'package:jaddah_household_survey/providers/survey.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";

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

    // var locations = const <ManualLocations, String>{
    //   ManualLocations.RS1: "RS1",
    //   ManualLocations.RS2: "RS2",
    //   ManualLocations.RS3: "RS3",
    //   ManualLocations.RS4: "RS4",
    //   ManualLocations.RS5: "RS5",
    //   ManualLocations.RS6: "RS6",
    //   ManualLocations.RS7: "RS7",
    //   ManualLocations.RS8: "RS8",
    //   ManualLocations.RS9: "RS9",
    //   ManualLocations.RS10: "RS10",
    //   ManualLocations.RS11: "RS11",
    //   ManualLocations.RS12: "RS12",
    //   ManualLocations.RS13: "RS13",
    //   ManualLocations.RS14: "RS14",
    //   ManualLocations.RS15: "RS15",
    //   ManualLocations.RS16: "RS16",
    //   ManualLocations.RS17: "RS17",
    //   ManualLocations.RS18: "RS18",
    //   ManualLocations.RS19: "RS19",
    //   ManualLocations.RS20: "RS20",
    //   ManualLocations.RS21: "RS21",
    //   ManualLocations.RS22: "RS22",
    //   ManualLocations.RS23: "RS23",
    //   ManualLocations.RS24: "RS24",
    //   ManualLocations.RS25: "RS25",
    //   ManualLocations.BP1: "BP1",
    //   ManualLocations.BP2: "BP2",
    //   ManualLocations.BP3: "BP3",
    //   ManualLocations.BP4: "BP4",
    //   ManualLocations.BP5: "BP5",
    //   ManualLocations.BP6: "BP6",
    //   ManualLocations.BP7: "BP7",
    //   ManualLocations.BP8: "BP8",
    //   ManualLocations.RiyadhAirport: "مطار الرياض",
    //   ManualLocations.DamamAirport: "مطار الدمام",
    //   ManualLocations.GaddahAirport: "مطار جدة",
    //   ManualLocations.MadinahAirport: "مطار المدينة",
    //   ManualLocations.TaboukAirport: "مطار تبوك",
    //   ManualLocations.AbhahAirport: "مطار ابها",
    //   ManualLocations.RiyadhSabtko: "سابتكو الرياض",
    //   ManualLocations.DamamSabtko: "سابتكو الدمام",
    //   ManualLocations.GaddahSabtko: "سابتكو جدة",
    //   ManualLocations.MadinahSabtko: "سابتكو المدينة",
    //   ManualLocations.MakkahSabtko: "سابتكو مكة",
    //   ManualLocations.TaboukSabtko: "سابتكو تبوك",
    //   ManualLocations.KhamesMshetSabtko: "سابتكو خميس مشيط",
    //   ManualLocations.RiyadhTrain: "قطار الرياض",
    //   ManualLocations.RiyadhSarTrain: "قطار الرياض سار",
    //   ManualLocations.HaylTrain: "قطار حايل",
    //   ManualLocations.QasemTrain: "قطار القصيم",
    //   ManualLocations.DmamTrain: "قطار الدمام",
    //   ManualLocations.MakkahHaramTrain: "قطار الحرمين مكة",
    //   ManualLocations.MadinahHaramTrain: "قطار الحرمين المدينة",
    //   ManualLocations.GaddahHaramTrain: "قطار الحرمين جدة",
    // };
    var newMap = surveyList.groupListsBy((s) => s.header.interviewNumber).map(
          (key, value) => MapEntry(
            key,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text("${key} (${value.length})"),
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
                      ? [const Text("لم تقم بإدخال أى إستبيانات")]
                      : newMap.values.toList(),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ChangeNotifierProvider<SurveyProvider>.value(
                    value: surveyList[index].provider,
                    child: const SurveyTile()),
            itemCount: surveyList.length,
          ),
        ),
      ],
    );
  }
}
