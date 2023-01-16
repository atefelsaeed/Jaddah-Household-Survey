import 'package:flutter/cupertino.dart';

class VehiclesData {
  static List<VecModel> vecModel = [
    VecModel(
        title: "سيارة",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "سيارة كبيرة (SUV وما إلى ذلك)",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "ونيت",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "شاحنة",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "دراجة نارية",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: " اسكوتر",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "other",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
  ];

  static Map<String, List<dynamic>> fuelTypeCodes = {
    "Fuel type codes- V2-F": [
      'بنزين',
      'ديزل',
      'المكونات الكهربائية الهجينة (PHEV)',
      'هجين بالكامل (HEV)',
      'هجين معتدل (HEV)',
      'PNG / غاز البترول المسال',
      'كهربائى',
      'دراجة كهربائية',
      'أخر'
    ]
  };

  static Map<String, List<dynamic>> ownership = {
    "Ownership codes- V3-O": [
      'أسرة',
      'أرباب العمل',
      'مستأجرة',
      'أخر',
    ]
  };
  static Map<String, List<dynamic>> parkThisCar = {
    "Ownership codes- V3-O": [
      'المرأب الشخصى (المنزل)',
      'على جانب الطريق خالية',
      'على جانب الطريق مشحونة',
      'خارج الطريق / شاعرة',
      'الطرق الوعرة خالية',
      'خارج الطريق مشحونة',
      'فى الموقع سكنى مجانى',
      'على الموقع الدقة المشحونة'
    ]
  };

  static Map<String, dynamic> q2VecData = {
    "? How many bicycles (air-tubed) are there in your household": {
      "adults (18yrs +) For Work use": "0",
      "adults (18yrs +)  For Leisure": "0",
      "children (under 18yrs)": "0"
    }
  };
  static Map<String, dynamic> q3VecData = {
    " How far is the nearest public transport bus stop from your home by walk (in minutes) ?":
        [
      {"value": '< 5 mins walk', "isChick": false},
      {"value": '6-10 mins walk', "isChick": false},
      {"value": '11  - 15 mins walk', "isChick": false},
      {"value": ' More than 15 mins', "isChick": false},
      {"value": ' don’t know', "isChick": false},
    ]
  };
}

class VecModel {
  late String title;
  late int number = 0;
  late bool isChosen = false;
  late TextEditingController textEditingController;

  VecModel({
    required this.title,
    required this.isChosen,
    required this.number,
    required this.textEditingController,
  });
}
