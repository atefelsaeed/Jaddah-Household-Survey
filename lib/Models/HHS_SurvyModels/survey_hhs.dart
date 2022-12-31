import 'package:enum_to_string/enum_to_string.dart';

import '../../Data/Enums/hhs_enums.dart';
import '../survey.dart';

import '/providers/survey_pt.dart';

class SurveyPT extends Survey {
  // Journy journy = Journy();
  // CaseInfo caseInfo = CaseInfo();
  // List<JourneyExample> examples = [];
  // JobStatus jobStatus = JobStatus();
  // late int familyCount;
  // late String phoneNumber;
  // String name = "";

  SurveyPT() : super(SurveyType.pt) {
    super.provider = SurveyPTProvider(this);
    super.header = HeaderBase();
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = EnumToString.convertToString(type, camelCase: true);
    data['synced'] = synced;
    data['headerLat'] = header.locationLat;
    data['headerLong'] = header.locationLong;
    data['headerDate'] = header.interviewDate.toString();
    data['headerEmpNumber'] = header.empNumber;
    data['headerInterviewNumber'] = header.interviewNumber;
    data['headerDistrictName'] = header.districtName;
    data['headerZoneNumber'] = header.zoneNumber;
    data['hhsCity'] = header.householdAddress!.city;
    data['hhsBuildingName'] = header.householdAddress!.buildingName;
    data['hhsStreetName'] = header.householdAddress!.streetName;
    data['hhsStreetNumber'] = header.householdAddress!.streetNumber;
    data['hhsNearestLandMark'] = header.householdAddress!.nearestLandMark;
    data['hhsBlockNearestCrossStreets'] =
        header.householdAddress!.blockNearestCrossStreets;
    data['hhsAreaSuburb'] = header.householdAddress!.areaSuburb;

    // data['jobStatusIncomeRange'] =
    //     EnumToString.convertToString(jobStatus.incomeRange, camelCase: true);

    // data['journeyExamples'] = examples.map((e) => e.toJson()).toList();
    return data;
  }

  SurveyPT.fromJson(Map<String, dynamic> json)
      : super(EnumToString.fromString(SurveyType.values, json['type'],
            camelCase: true)!) {
    provider = SurveyPTProvider(this);
    id = json['id'];
    synced = json['synced'];
    header = HeaderBase();
    header.locationLat = json['headerLat'];
    header.locationLong = json['headerLong'];
    header.interviewDate = DateTime.parse(json['headerDate']);
    header.empNumber = json['headerEmpNumber'];
    header.interviewNumber = json['headerInterviewNumber'];
    header.districtName = json['headerDistrictName'];
    header.zoneNumber = json['headerZoneNumber'];
    header.householdAddress!.city = json['hhsCity'];
    header.householdAddress!.buildingName = json['hhsBuildingName'];
    header.householdAddress!.streetName = json['hhsStreetName'];
    header.householdAddress!.streetNumber = json['hhsStreetNumber'];
    header.householdAddress!.nearestLandMark = json['hhsNearestLandMark'];
    header.householdAddress!.blockNearestCrossStreets =
        json['hhsBlockNearestCrossStreets'];
    header.householdAddress!.areaSuburb = json['hhsAreaSuburb'];
    //
    // examples = json['journeyExamples']
    //     .map<JourneyExample>(
    //         (e) => JourneyExample.fromJson(e as Map<String, dynamic>))
    //     .toList();
    // suggestions = json['suggestions']
    //     .map<SuggestionCard>(
    //         (e) => SuggestionCard.fromJson(e as Map<String, dynamic>))
    //     .toList(); ]
    // header.manualLocation = EnumToString.fromString(
    //          ManualLocations.values, json['manualLocation'],
    //          camelCase: true)!;
  }
}
