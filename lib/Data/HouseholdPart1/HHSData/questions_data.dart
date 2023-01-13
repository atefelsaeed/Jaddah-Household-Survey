

class QuestionsData {
  static Map<String, List<dynamic>> qh1 = {
    "? What best describes this dwelling type": [
      ' shared Villa',
      ' villa',
      ' flat- family',
      ' own room in a flat- single person',
      'shared flat- family',
      ' shared room in a flat with one other',
      ' Arabian House',
      'shared room in a flat with more than one/bed-space ',
      'Other'
    ]
  };

  static Map<String, List<dynamic>> qh2 = {
    "Is this dwelling...": [
      'Owner occupied',
      'Rented',
      'Provided by the employer',
      'Provided by the government',
      'Other'
    ]
  };
  static Map<String, dynamic> qh3 = {
    "?How many bedrooms are there in the accommodation you live in": [
      {"value": '1', "isChick": false},
      {"value": '2', "isChick": false},
      {"value": '3', "isChick": false},
      {"value": '4', "isChick": false},
      {"value": '5', "isChick": false},
      {"value": '6', "isChick": false},
      {"value": '7', "isChick": false},
      {"value": '8', "isChick": false},
      {"value": '9', "isChick": false},
      {"value": '10', "isChick": false},
      {"value": '11', "isChick": false},
      {"value": '>12', "isChick": false},
    ],
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals"
  };
  static Map<String, dynamic> qh4 = {
    "? How many separate families live at this address": [
      {"value": '1', "isChick": false},
      {"value": '2', "isChick": false},
      {"value": '3', "isChick": false},
      {"value": '4', "isChick": false},
      {"value": '5', "isChick": false},
      {"value": '6', "isChick": false},
      {"value": '7', "isChick": false},
      {"value": '8', "isChick": false},
      {"value": '9', "isChick": false},
      {"value": '10', "isChick": false},
    ],
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> qh5 = {
    "Qh5": "How many people usually live at this address? ( all families)",
    "subTitle": "Number of people include servants/maid and live-in drivers"
  };

  static Map<String, dynamic> qh6 = {
    "?How many people are in each of the separate family living at this address":
        [],
    "subTitle": "Number of people include servants/maid and live-in drivers"
  };

  q6Answer(adults, child, totalNumber) {
    Map<String, dynamic> qh5Answer = {
      "adults (18yrs +)": adults.toString(),
      "children (under 18yrs)": child.toString(),
      "Total Number of Vehicles in each family": totalNumber.toString()
    };
    return qh5Answer;
  }

  static Map<String, dynamic> qh7 = {
    "?How many years have you/your family lived at this particular address": [
      {"value": 'under 1 yr.', "isChick": false},
      {"value": '1 - 3 yrs.', "isChick": false},
      {"value": '3 - 5 yrs.', "isChick": false},
      {"value": '3 - 5 yrs.', "isChick": false},
      {"value": '10 yrs. +', "isChick": false},
    ]
  };
  static Map<String, dynamic> qh7_2 = {
    'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
        [
      {"value": 'نعم', "isChick": false},
      {"value": 'لا', "isChick": false},
    ]
  };
  static Map<String, dynamic> qh8_1 = {
    "?How many pedal-cycles are owned or used by this household": {
      "adults (18yrs +)": "0",
      "children (under 18yrs)": "0",
      "Total Number of Vehicles in each family": "0"
    }
  };
  static Map<String, dynamic> qh8_2 = {
    "?How many Electric Bicycles are owned or used by this household": {
      'Total number of bikes': "0",
      'Adult bikes (18 yrs.+)': "0",
      'Children\'s bikes (<18 yrs.)': "0",
    }
  };
  static Map<String, dynamic> qh8_3 = {
    "?How many E Scooters are owned or used by this household": {
      'Total number of bikes': "0",
      'Adult bikes (18 yrs.+)': "0",
      'Children\'s bikes (<18 yrs.)': "0",
    }
  };
  static Map<String, dynamic> qh9 = {
    "Please indicate in which of the following bands your total monthly household income inclusive of benefits falls?":
        [
      '< 1500 SAR',
      '1500 - 2000 SAR',
      '2000 - 3000 SAR',
      '3000 - 5000 SAR',
      '5000 - 8000 SAR',
      '8000 - 12000 SAR',
      '12000 - 18000 SAR',
      '18000 - 25000 SAR',
      'Over 25,000 SAR',
      'Confidential',
    ]
  };
}
