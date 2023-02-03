import 'package:flutter/material.dart';

import 'occupation_model.dart';
import 'personal_question.dart';

class PersonModel {
  PersonalHeadData? personalHeadData;
  OccupationModel? occupationModel;
  PersonalQuestion? personalQuestion;
  TextEditingController personName = TextEditingController();


  PersonModel({
    this.personalQuestion,
    this.occupationModel,
    this.personalHeadData,
    required this.personName,
  });

  PersonModel.fromJson(Map<String, dynamic> json) {
    personalHeadData = PersonalHeadData.fromJson(json['personalHeadData']);
    occupationModel = OccupationModel.fromJson(json['occupationModel']);
    personalQuestion = PersonalQuestion.fromJson(json['personalQuestion']);
    personName.text = json['personName'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['personName'] = personName.text;
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
  TextEditingController age = TextEditingController();
  String? nationalityType;
  TextEditingController nationality =
      TextEditingController(); //open if not سعودي

  PersonalHeadData({
    required this.age,
    this.nationalityType,
    required this.nationality,
    this.gender,
    this.checkAge,
    this.refuseToTellAge,
    this.relationshipHeadHHS,
  });

  PersonalHeadData.fromJson(Map<String, dynamic> json) {
    relationshipHeadHHS = json['relationshipHeadHHS'] ?? "";
    gender = json['gender'] ?? "";
    // checkAge = json['checkAge'];
    refuseToTellAge = json['refuseToTellAge'];
    age.text = json['age'] ?? "";
    nationalityType = json['nationalityType'] ?? "";
    nationality.text = json['nationality'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['relationshipHeadHHS'] = relationshipHeadHHS ?? "";
    data['gender'] = gender ?? "";
    // data['checkAge'] = checkAge;
    data['refuseToTellAge'] = refuseToTellAge;
    data['age'] = age.text ?? "";
    data['nationalityType'] = nationalityType ?? "";
    data['nationality'] = nationality.text;
    return data;
  }
}
