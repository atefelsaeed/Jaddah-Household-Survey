mixin SelectTimeData {
  String time12to24Format(String time) {
// var time = "12:01 AM";
    int h = int.parse(time.split(":").first);
    int m = int.parse(time.split(":").last.split(" ").first);
    String meridium = time.split(":").last.split(" ").last.toLowerCase();
    if (meridium == "pm") {
      if (h != 12) {
        h = h + 12;
      }
    }
    if (meridium == "am") {
      if (h == 12) {
        h = 00;
      }
    }
    // String newTime = "${h == 0 ? "00" : h}:${m == 0 ? "00" : m}";
    String newTime = "${h == 0 ? "00" : h}";
    print('new time is');
    print(newTime);

    return newTime;
  }
}