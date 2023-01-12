import 'package:enum_to_string/enum_to_string.dart';
import 'package:jaddah_household_survey/Models/Person_SurveyModel/person_model.dart';

import '/providers/survey_hhs.dart';
import '../../Data/Enums/hhs_enums.dart';
import '../Trips_SurveyModel/trips_model.dart';
import '../Vehicles_SurveyModel/vehicles_body_type.dart';
import '../Vehicles_SurveyModel/vehicles_model.dart';
import '../survey.dart';
import 'hhs_models.dart';

class SurveyPT extends Survey {
  HouseholdQuestions householdQuestions = HouseholdQuestions(

      hhsPedalCycles: BikesType("", "", ""),
      hhsElectricCycles: BikesType("", "", ""),
      hhsElectricScooter: BikesType("", "", ""));
  VehiclesModel vehiclesData = VehiclesModel(); //
  List<PersonModel>? personData; //
  List<SeparateFamilies>? hhsSeparateFamilies;
  List<TripsModel>? tripsList; //
  List<VehiclesBodyType>? vehiclesBodyType;

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
    data['vehiclesData'] = vehiclesData.toJson();
    data['headerEmpNumber'] = header.empNumber;
    data['headerInterviewNumber'] = header.interviewNumber;
    data['headerDistrictName'] = header.districtName;
    data['headerZoneNumber'] = header.zoneNumber;
    data['hhsCity'] = header.householdAddress.city;
    data['hhsBuildingName'] = header.householdAddress.buildingName;
    data['hhsStreetName'] = header.householdAddress.streetName;
    data['hhsStreetNumber'] = header.householdAddress.streetNumber;
    data['hhsNearestLandMark'] = header.householdAddress.nearestLandMark;
    data['hhsBlockNearestCrossStreets'] =
        header.householdAddress.blockNearestCrossStreets;
    data['hhsAreaSuburb'] = header.householdAddress.areaSuburb;
    //========householdQuestions===============================
    data['hhsDwellingType'] = householdQuestions.hhsDwellingType;
    data['hhsIsDwelling'] = householdQuestions.hhsIsDwelling;
    data['hhsNumberBedRooms'] = householdQuestions.hhsNumberBedRooms;
    data['hhsNumberSeparateFamilies'] =
        householdQuestions.hhsNumberSeparateFamilies;
    data['hhsNumberAdults'] = householdQuestions.hhsNumberAdults;
    data['hhsNumberChildren'] = householdQuestions.hhsNumberChildren;
    data['hhsNumberYearsInAddress'] =
        householdQuestions.hhsNumberYearsInAddress;
    data['hhsIsDemolishedAreas'] = householdQuestions.hhsIsDemolishedAreas;
    data['hhsDemolishedAreas'] = householdQuestions.hhsDemolishedAreas;
    //==========hhsPedalCycles(PC)============
    data['hhsPCTotalBikesNumber'] =
        householdQuestions.hhsPedalCycles.totalBikesNumber;
    data['hhsPCAdultsBikesNumber'] =
        householdQuestions.hhsPedalCycles.adultsBikesNumber;
    data['hhsPCChildrenBikesNumber'] =
        householdQuestions.hhsPedalCycles.childrenBikesNumber;
    //======hhsElectricCycles(EC)============
    data['hhsECTotalBikesNumber'] =
        householdQuestions.hhsElectricCycles.totalBikesNumber;
    data['hhsECAdultsBikesNumber'] =
        householdQuestions.hhsElectricCycles.adultsBikesNumber;
    data['hhsECChildrenBikesNumber'] =
        householdQuestions.hhsElectricCycles.childrenBikesNumber;
    //======hhsElectricScooter(ES)============
    data['hhsESTotalBikesNumber'] =
        householdQuestions.hhsElectricScooter.totalBikesNumber;
    data['hhsESAdultsBikesNumber'] =
        householdQuestions.hhsElectricScooter.adultsBikesNumber;
    data['hhsESChildrenBikesNumber'] =
        householdQuestions.hhsElectricScooter.childrenBikesNumber;
    data['hhsTotalIncome'] = householdQuestions.hhsTotalIncome ?? '';

    data['hhsSeparateFamilies'] =
        hhsSeparateFamilies!.map((e) => e.toJson()).toList();
    data['vehiclesBodyType'] =
        vehiclesBodyType!.map((e) => e.toJson()).toList();
    // data['personData'] = personData!.map((e) => e.toJson()).toList();
    // data['tripsList'] = tripsList!.map((e) => e.toJson()).toList();
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
    header.householdAddress.city = json['hhsCity'];
    header.householdAddress.buildingName = json['hhsBuildingName'];
    header.householdAddress.streetName = json['hhsStreetName'];
    header.householdAddress.streetNumber = json['hhsStreetNumber'];
    header.householdAddress.nearestLandMark = json['hhsNearestLandMark'];
    header.householdAddress.blockNearestCrossStreets =
        json['hhsBlockNearestCrossStreets'];
    header.householdAddress.areaSuburb = json['hhsAreaSuburb'];
    //================householdQuestions================
    householdQuestions.hhsDwellingType = json['hhsDwellingType'];
    householdQuestions.hhsIsDwelling = json['hhsIsDwelling'];
    householdQuestions.hhsNumberBedRooms = json['hhsNumberBedRooms'];
    householdQuestions.hhsNumberSeparateFamilies =
        json['hhsNumberSeparateFamilies'];
    householdQuestions.hhsNumberAdults = json['hhsNumberAdults'];
    householdQuestions.hhsNumberChildren = json['hhsNumberChildren'];
    householdQuestions.hhsNumberYearsInAddress =
        json['hhsNumberYearsInAddress'];
    householdQuestions.hhsIsDemolishedAreas = json['hhsIsDemolishedAreas'];
    householdQuestions.hhsDemolishedAreas = json['hhsDemolishedAreas'];
    //==========hhsPedalCycles(PC)============
    householdQuestions.hhsPedalCycles.totalBikesNumber =
        json['hhsPCTotalBikesNumber'];
    householdQuestions.hhsPedalCycles.adultsBikesNumber =
        json['hhsPCAdultsBikesNumber'];
    householdQuestions.hhsPedalCycles.childrenBikesNumber =
        json['hhsPCChildrenBikesNumber'];
    //======hhsElectricCycles(EC)============
    householdQuestions.hhsElectricCycles.totalBikesNumber =
        json['hhsECTotalBikesNumber'];
    householdQuestions.hhsElectricCycles.adultsBikesNumber =
        json['hhsECAdultsBikesNumber'];
    householdQuestions.hhsElectricCycles.childrenBikesNumber =
        json['hhsECChildrenBikesNumber'];
    //======hhsElectricScooter(ES)============
    householdQuestions.hhsElectricScooter.totalBikesNumber =
        json['hhsESTotalBikesNumber'];
    householdQuestions.hhsElectricScooter.adultsBikesNumber =
        json['hhsESAdultsBikesNumber'];
    householdQuestions.hhsElectricScooter.childrenBikesNumber =
        json['hhsESChildrenBikesNumber'];
    householdQuestions.hhsTotalIncome = json['hhsTotalIncome'];
    vehiclesData = VehiclesModel.fromJson(json['vehiclesData']);

    hhsSeparateFamilies = json['hhsSeparateFamilies']
        .map<SeparateFamilies>(
            (e) => SeparateFamilies.fromJson(e as Map<String, dynamic>))
        .toList();
    vehiclesBodyType = json['vehiclesBodyType']
        .map<VehiclesBodyType>(
            (e) => VehiclesBodyType.fromJson(e as Map<String, dynamic>))
        .toList();
    // personData = json['personData']
    //     .map<PersonModel>(
    //         (e) => PersonModel.fromJson(e as Map<String, dynamic>))
    //     .toList();
    // tripsList = json['tripsList']
    //     .map<TripsModel>((e) => PersonModel.fromJson(e as Map<String, dynamic>))
    //     .toList();
  }
}
