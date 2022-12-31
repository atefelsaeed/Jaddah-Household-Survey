import '../Data/Enums/hhs_enums.dart';
import '/providers/survey.dart';
import 'HHS_SurvyModels/hhs_models.dart';

class HeaderBase {
  late double locationLat;
  late double locationLong;
  late DateTime interviewDate;
  late int interviewNumber;
  late String districtName;
  late String zoneNumber;
  late int empNumber;
  HouseholdAddress? householdAddress;

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

  set journeyStarDistrictName(String? journeyStarDistrictName) {}

  set journeyEndDistrictName(String? journeyEndDistrictName) {}

  Map<String, dynamic> toJson();
}
