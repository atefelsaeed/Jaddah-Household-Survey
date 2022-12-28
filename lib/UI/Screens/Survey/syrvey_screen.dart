import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/surveyHeader.dart';

class SurveyScreen extends StatefulWidget {
  SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jaddah Household'),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.save), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                SurveyHeader(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
