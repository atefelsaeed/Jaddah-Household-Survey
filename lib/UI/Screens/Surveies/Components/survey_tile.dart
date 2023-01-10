import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Data/Enums/hhs_enums.dart';
import 'package:jaddah_household_survey/Providers/survey.dart';
import 'package:jaddah_household_survey/Providers/survey_hhs.dart';
import 'package:jaddah_household_survey/Providers/surveys.dart';
import 'package:provider/provider.dart';

class SurveyTile extends StatefulWidget {
  const SurveyTile({
    Key? key,
  }) : super(key: key);

  @override
  State<SurveyTile> createState() => _SurveyTileState();
}

class _SurveyTileState extends State<SurveyTile> {
  late final subscription;
  @override
  initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) setState(() {});
        // Got a new connectivity status!
      },
    );
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final survey = Provider.of<SurveyPTProvider>(context, listen: true);
    final SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              log(json.encode(survey.data.toJson()));
            },
            child: GestureDetector(
              onTap: () {
                log(json.encode(survey.data.toJson()));
              },
              child: CircleAvatar(
                backgroundColor: survey.synced ? Colors.green : Colors.black54,
                child: survey.synced
                    ? const Icon(Icons.cloud)
                    : const Icon(Icons.sd_card),
              ),
            ),
          ),
          title: Text(survey.interViewDate.toString()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                survey.type == SurveyType.pt
                    ? "شخصي"
                    : survey.type == SurveyType.cars
                        ? "أجرة"
                        : "نقل",
              ),
              Text('الرقم التعريفي للمدخل (${survey.headerEmpNumber})')
            ],
          ),
          trailing: Consumer<SurveyPTProvider>(
            builder: (ctx, s, b) => !s.synced
                ? CircleAvatar(
                    radius: 30,
                    child: s.syncing
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : IconButton(
                            onPressed: () {
                              s.sync(callback: surveys.save);
                            },
                            icon: const Icon(Icons.sync),
                            color: Colors.white,
                          ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
