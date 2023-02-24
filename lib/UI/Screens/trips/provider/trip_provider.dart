import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';

class TripProvider extends ChangeNotifier {
  List<String> personTrip = [];
  removeTrip(int i) {
    TripModeList.tripModeList.removeAt(i);
    notifyListeners();
  }

  initTrip(){
    TripModeList.tripModeList[0].person = [];
    for (int i = 0; i < PersonModelList.personModelList.length; i++) {
      TripModeList.tripModeList[0].person
          .add(PersonModelList.personModelList[i].personName.text);
    }
    notifyListeners();

  }

  addOwnerTrip(int i, String p) {
    TripModeList.tripModeList[i].friendPerson["friendPerson"] = [];
    for (int x = 0; x < TripModeList.tripModeList[i].person.length; x++) {
      debugPrint('Add friendPerson!!!');
      debugPrint(TripModeList.tripModeList[i].person[x].toString());

      if (TripModeList.tripModeList[i].person[x].toString() != p) {
        TripModeList.tripModeList[i].friendPerson["friendPerson"].add({
          "value": TripModeList.tripModeList[i].person[x],
          "isChick": false
        });
      }
    }


      TripModeList.tripModeList[i].chosenPerson = p!;
      debugPrint(personTrip.toString());

      for (int x = 0;
      x <
          TripModeList
              .tripModeList.length;
      x++) {
        if (TripModeList.tripModeList[x]
            .chosenFriendPerson
            .contains(p) &&
            personTrip.contains(p) ==
                false) {
          personTrip.add(p);
          TripModeList.tripModeList[i] =
          TripModeList.tripModeList[x];
          break;
        }
      }


      debugPrint(TripModeList.tripModeList[i].friendPerson.toString());

      if (TripModeList.tripModeList[i].friendPerson.isNotEmpty) {
        TripModeList.tripModeList[i].showFriend = true;
      }
      notifyListeners();
    }

}
