import 'package:jaddah_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:jaddah_household_survey/UI/Widgets/show_dialog_error.dart';

class TripConditions {
  bool checkIsCarDriver(int i) {
    var bas = TripModeList.tripModeList[i].travelTypeModel;
    if (((TripModeList.tripModeList[i].travelWay!.mainMode == 'سائق سيارة') ||
            (TripModeList.tripModeList[i].travelWay!.accessMode ==
                'سائق سيارة')) &&
        (bas.travelType != 'سيارة')) {
      const ShowErrorDialog(title: ' بماذا ذهبت ؟', content: 'في سؤال 6 "الوضع الرئيسي" او "وضع الوصول" اذا كان الاختيار سائق سيارة يجب أن يكون الجواب في سؤال 8 بماذا ذهبت ؟ الجواب "سيارة"');
      return false;
    } else {
      return true;
    }
  }

  setIsCarDriver(int i) {
    var bas = TripModeList.tripModeList[i].travelTypeModel;
    if (TripModeList.tripModeList[i].travelWay!.mainMode == 'سائق سيارة' ||
        TripModeList.tripModeList[i].travelWay!.accessMode == 'سائق سيارة') {
      bas.travelType = 'سيارة';
    } else {
      bas.travelType = '';
    }
  }
}
