import '/providers/survey.dart';
import '../Data/Enums/hhs_enums.dart';
import 'HHS_SurvyModels/hhs_models.dart';

class HeaderBase {
  late double locationLat;
  late double locationLong;
  late DateTime interviewDate;
  late int interviewNumber;
   String? districtName;
  late String zoneNumber;
  late int empNumber;
  HouseholdAddress householdAddress = HouseholdAddress();

  HeaderBase();
}

abstract class Survey {
  String id = "";
  late HeaderBase header;
  final SurveyType type;
  bool synced = false;
  late SurveyProvider provider;

  Survey(this.type);

  set suggestionName(String suggestionName) {}

  // set journeyStarDistrictName(String? journeyStarDistrictName) {}

  // set journeyEndDistrictName(String? journeyEndDistrictName) {}

  Map<String, dynamic> toJson();
}
