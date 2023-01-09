import 'package:flutter/material.dart';

import 'occupation_model.dart';
import 'personal_question.dart';

class PersonModel {
  PersonalHeadData? personalHeadData;
  OccupationModel? occupationModel;
  PersonalQuestion? personalQuestion;

  PersonModel({
    this.personalQuestion,
    this.occupationModel,
    this.personalHeadData,
  });

  PersonModel.fromJson(Map<String, dynamic> json) {
    personalHeadData = PersonalHeadData.fromJson(json['personalHeadData']);
    occupationModel = OccupationModel.fromJson(json['occupationModel']);
    personalQuestion = PersonalQuestion.fromJson(json['personalQuestion']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['personalHeadData'] = personalHeadData!.toJson();
    data['occupationModel'] = occupationModel!.toJson();
    data['personalQuestion'] = personalQuestion!.toJson();
    return data;
  }
}

class PersonalHeadData {
  String? relationshipHeadHHS;
  String? gender;
  bool? checkAge;
  bool? refuseToTellAge;
  TextEditingController? age;
  String? nationalityType;
  TextEditingController? nationality; //open if not Saudi National

  PersonalHeadData({
    this.age,
    this.nationalityType,
    this.nationality,
    this.gender,
    this.checkAge,
    this.refuseToTellAge,
    this.relationshipHeadHHS,
  });

  PersonalHeadData.fromJson(Map<String, dynamic> json) {
    relationshipHeadHHS = json['relationshipHeadHHS'] ?? "";
    gender = json['gender'] ?? "";
    checkAge = json['checkAge'];
    refuseToTellAge = json['refuseToTellAge'];
    age = json['age'] ?? "";
    nationalityType = json['nationalityType'] ?? "";
    nationality = json['nationality'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['relationshipHeadHHS'] = relationshipHeadHHS ?? "";
    data['gender'] = gender ?? "";
    data['checkAge'] = checkAge;
    data['refuseToTellAge'] = refuseToTellAge;
    data['age'] = age ?? "";
    data['nationalityType'] = nationalityType ?? "";
    data['nationality'] = nationality ?? "";
    return data;
  }
}
