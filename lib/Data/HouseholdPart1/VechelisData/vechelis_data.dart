import 'package:flutter/cupertino.dart';

class VehiclesData {
  static List<VecModel> vecModel = [
    VecModel(
        title: "car",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "Van",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "Large Car (SUV etc.)",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "E-Scooter",
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "Pick up",
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
      'Petrol',
      'Diesel',
      'PNG/LPG',
      'Son/Daughter',
      'Fully Hybrid(HEV)',
      'Mild Hybrid(MHEV)',
      'Electric -Bike',
      'Electric',
      'Other'
    ]
  };

  static Map<String, List<dynamic>> ownership = {
    "Ownership codes- V3-O": [
      'Select',
      'Employer s',
      'Household',
      'Rented',
      'Other',
    ]
  };
  static Map<String, List<dynamic>> parkThisCar = {
    "Ownership codes- V3-O": [
      'Personal Garage(home)',
      'Roadside free',
      'Roadside charged',
      'On site residential free',
      'Off road free',
      'Off Road charged',
      'On Site Res charged',
      'Other'
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

