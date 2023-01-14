class PersonData {
  static Map<String, dynamic> relationshipToTheHeadOfHousehold = {
    " Relationship to the Head of Household": [
      'ذاتي / رب الأسرة',
      'زوج',
      'زوجة',
      'إبن / إبنه',
      'الاباء / الاجداد',
      'إخوة',
      'أقارب أخرين',
      'زميل فى العمل',
      'خادمة',
      'سائق',
      'غير ذى صلة',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> gender = {
    "gender": [
      'ذكر',
      'أنثى',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> groupAge = {
    "group Age": [
      {"value": '< 6', "isChick": false, "type": "2"},
      {"value": ' 6 - 11', "isChick": false, "type": "2"},
      {"value": '12 - 15', "isChick": false, "type": "2"},
      {"value": '16 - 18', "isChick": false, "type": "1"},
      {"value": '19 -24', "isChick": false, "type": "1"},
      {"value": ' 25 - 34', "isChick": false, "type": "1"},
      {"value": '35 - 44', "isChick": false, "type": "1"},
      {"value": '45 - 54', "type": "1", "isChick": false},
      {"value": '55 - 64', "isChick": false, "type": "1"},
      {"value": '65 - 74', "isChick": false, "type": "1"},
      {"value": '>74', "isChick": false, "type": "retired", "type": "retire"},
    ],
    "title": "MainOccupation",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> occupationSector = {
    "what is the Occupation Sector": [
      'Offices Government',
      'Education School',
      'Education University',
      'Medical Hospital- Health Centre (private)',
      'Medical Hospital- Health Centre (government)',
      'Construction Building',
      'Construction- infrastructure',
      'Business trading- non-office',
      'Other specify',
      'ndustrial/Mechanics, shops factory, logistic'
          'n-house maid, servant, driver, Gardner etc.',
      'Transport- port/harbour',
      'Industrial - QP/Gas',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> occupationLevelSector = {
    "Occupation Level Sector": [
      'High level director',
      ' Specialists/Experts',
      'Technicians',
      'Documenters',
      'Shop employees',
      'Agriculture and fishing workers',
      'Crafts workers',
      'Industrial workshop workers',
      'Other mid-level employees',
      'Other (specify)',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> workingHour = {
    " Do you have flexible working hours?": [
      'Yes- always',
      'Yes- sometime',
      'No',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> workplace = {
    "what best describe your workplace location(s)?": [
      'Have one work location (outside of home, may also telework)',
      'Work location regularly varies (work in different offices or jobsites)',
      'Work at home only (only telework or self-employed)',
      'Drive/Travel for a living (e.g. Bus/truck driver, delivery person)',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> commute = {
    "how many days a week do you commute to work?": [
      '4- 5 days or more',
      '3 - 4 days',
      '1 - 2 days',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> bike = {
    "How many days a week do you bike to work?": [
      '< 6',
      ' 6 - 11',
      '12 - 15',
      '16 - 18',
      '19 -24',
      ' 25 - 34',
      '35 - 44',
      '45 - 54',
      '55 - 64',
      '65 - 74',
      '>74'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> employeeOffer = {
    " Does your employer offer the opportunity for you to telecommute from home instead of traveling to work on a weekday?":
        [
      '< 6',
      ' 6 - 11',
      '12 - 15',
      '16 - 18',
      '19 -24',
      ' 25 - 34',
      '35 - 44',
      '45 - 54',
      '55 - 64',
      '65 - 74',
      '>74'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> timeWorkForm = {
    "How often do you work from home instead of traveling to work per week on average?":
        [
      '< 6',
      ' 6 - 11',
      '12 - 15',
      '16 - 18',
      '19 -24',
      ' 25 - 34',
      '35 - 44',
      '45 - 54',
      '55 - 64',
      '65 - 74',
      '>74'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> travelAverage = {
    "? How often do you work from home instead of traveling to work per week on average":
        [
      '< 6',
      ' 6 - 11',
      '12 - 15',
      '16 - 18',
      '19 -24',
      ' 25 - 34',
      '35 - 44',
      '45 - 54',
      '55 - 64',
      '65 - 74',
      '>74'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> carSharing = {
    "?do you have car sharing /car pooling scheme": [
      '< 6',
      ' 6 - 11',
      '12 - 15',
      '16 - 18',
      '19 -24',
      ' 25 - 34',
      '35 - 44',
      '45 - 54',
      '55 - 64',
      '65 - 74',
      '>74'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> drivingLiences = {
    "?What type of driving licence do you have": [
      'always',
      'never',
      'some Time',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> busBuss = {
    " ?Do you have a Bus Pass": [
      'Yes',
      'No',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> licence = {
    " ? What type of driving licence do you have": [
      'Car only',
      'Motorcycle only',
      'Car and Motorcycle both',
      'Light Goods Vehicles',
      'Heavy Goods Vehicles',
      'No Licence',
      'Other',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> transporterMoblity = {
    "?Do you have any disability/Special Needs for Transport Mobility": [
      'no problem',
      'wheelchair user',
      'partially blind',
      'blind',
      'speech and heading impairment',
      'difficulty in standing/walking',
      'Other.. Specify',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> nationality = {
    "QPurposeOfBeingThere": [
      {"value": 'سعودي', "isChick": false},
      {"value": 'وافد عربي', "isChick": false},
      {"value": 'وافد اجنبي', "isChick": false},
    ],
    "title": "nationality",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> mainOccupation = {
    "MainOccupation": [
      {
        "value": 'يعمل بدوام كامل',
        "isChick": false,
        "type": "employee",
      },
      {
        "value": 'عاطلين عن العمل',
        "isChick": false,
        "type": "unemployee",
      },
      {
        "value": 'العمل بدوام جزئي (أقل من 5 ساعات في اليوم)',
        "isChick": false,
        "type": "employee"
      },
      {
        "value": 'العاملين لحسابهم الخاص (الأعمال الخاصة)',
        "isChick": false,
        "type": "employee"
      },
      {
        "value": 'طالب - مدرسة ابتدائية',
        "isChick": false,
        "type": "employee",
      },
      {
        "value": 'طالب - مدرسة متوسطة',
        "isChick": false,
        "type": "student",
      },
      {
        "value": 'طالب - مدرسة ثانوية',
        "isChick": false,
        "type": "student"
      },
      {
        "value": ' طالب - الكلية: بدوام كامل (لا يعمل)',
        "type": "student",
        "isChick": false
      },
      {
        "value": ' الطالب - الكلية: بدوام كامل - يعمل بدوام جزئي',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - كلية: دوام جزئي - يعمل بدوام جزئي',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - جامعي: دوام كامل (لا يعمل) ',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - جامعي: دوام كامل - يعمل بدوام جزئي ',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - جامعي: دوام جزئي - يعمل بدوام جزئي ',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'شخص البيت',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'معاق / مريض',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'متقاعد',
        "isChick": false,
        "type": "retired",
      },
      {
        "value": 'طفل فى الحضانة',
        "isChick": false,
        "type": "retired",
      },
      {
        "value": 'طفل ليس فى الحضانة',
        "isChick": false,
        "type": "retired",
      },
      {
        "value": 'رفض',
        "isChick": false,
        "type": "retired",
      },
    ],
    "title": "MainOccupation",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };
}
