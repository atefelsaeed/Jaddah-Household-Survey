import 'package:jaddah_household_survey/Data/HouseholdPart1/empty_data/empty_person.dart';

import 'empty_data/empty_hhs.dart';
import 'empty_data/empty_vechels.dart';

class HHSEmptyData {
  static emptyData() {
    EmptyPerson.emptyPerson();
    EmptyHHS.emptyHSS();
    EmptyVehicles.emptyVehicles();
  }
}
