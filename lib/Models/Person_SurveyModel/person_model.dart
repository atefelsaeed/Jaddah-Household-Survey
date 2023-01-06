import 'occupation_model.dart';
import 'personal_question.dart';

class PersonModel {
  PersonalHeadData? personalHeadData;
  OccupationModel? occupationModel;
  PersonalQuestion? personalQuestion;

  PersonModel();

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
  String? ageType;
  String? age;
  String? nationalityType;
  String? nationality; //open if not Saudi National

  PersonalHeadData();

  PersonalHeadData.fromJson(Map<String, dynamic> json) {
    relationshipHeadHHS = json['relationshipHeadHHS'] ?? "";
    gender = json['gender'] ?? "";
    ageType = json['ageType'] ?? "";
    age = json['age'] ?? "";
    nationalityType = json['nationalityType'] ?? "";
    nationality = json['nationality'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['relationshipHeadHHS'] = relationshipHeadHHS ?? "";
    data['gender'] = gender ?? "";
    data['ageType'] = ageType ?? "";
    data['age'] = age ?? "";
    data['nationalityType'] = nationalityType ?? "";
    data['nationality'] = nationality ?? "";
    return data;
  }
}
