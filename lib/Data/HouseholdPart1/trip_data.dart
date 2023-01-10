class TripData {
  static Map<String, dynamic> purposeOfBeingThere = {
    "QPurposeOfBeingThere": [
      {"value": 'home', "isChick": false},
      {"value": 'Holiday Home/Hotel', "isChick": false},
      {"value": ' Work', "isChick": false},
      {"value": 'Employer Business', "isChick": false},
      {"value": 'Education', "isChick": false},
      {"value": 'Personal Business', "isChick": false},
      {"value": 'Visiting Friends/Relatives', "isChick": false},
      {"value": 'Recreation/Leisure', "isChick": false},
      {"value": ' Escort for other purpose', "isChick": false},
      {"value": 'Other', "isChick": false},
    ],
    "title": "?What was the purpose of being there",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> mainMade = {
    "mainMade": [
      'Car Passenger',
      'Taxi (ask about type of taxi)',
      ' Car Driver',
      'Public Bus',
      'Company Bus',
      'School Bus'
          'Motorcycle'
          'Walk',
      'Bi-cycle'
          'Other'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> AcMode = {
    "AcMode": [
      'Car Passenger',
      'Taxi (ask about type of taxi)',
      ' Car Driver',
      'Public Bus',
      'Company Bus',
      'School Bus'
          'Motorcycle'
          'Walk',
      'Bi-cycle'
          'Other'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> memberHouseHoldTravel = {
    "?Which members of the household travelled with you": [
      'Public Car Park - paid',
      ' On-street - marked space',
      'On-street - unmarked space',
      ' Valet parking',
      'Dropped Off - private',
      'Dropped Off - taxi',
      '  Other'
    ],
    "title": "?Which members of the household travelled with you",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> whereDidYouPark = {
    "?where did you park": [
      'Public Car Park - paid',
      'On-street - marked space',
      'On-street - unmarked space',
      'Valet parking',
      'Valet parking',
      'Dropped Off - taxi',
      'public Transporter',
      'Other'
    ],
    "title": "?where did you park",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> whatTypeOfTaxi = {
    "?what type of taxi did you use and how much fare did you pay": [
      'Uber',
      'Careem',
      'Pixi',
      'Green Taxi',
    ],
    "title": "?where did you park",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> howOftenDoYouMakeThisTrip = {
    "?How often do you make this Trip": [
      '  5 days a week',
      " 4 days a week",
      "3 days a week",
      "2 days a week",
      "less than once a week",
      "less than once a mont'"
    ],
    "title": "?How often do you make this Trip",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
}
