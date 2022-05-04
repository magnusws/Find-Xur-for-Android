import 'package:cloud_firestore/cloud_firestore.dart';

Duration currentTimeUntilNextUpdate(Timestamp nextUpdate) {
    var now = new DateTime.now();
    now = now.toUtc();
    var next = new DateTime.fromMicrosecondsSinceEpoch(nextUpdate.microsecondsSinceEpoch, isUtc: true); // i sekunder
    return next.difference(now);
}

class TimeLeft {
  int days;
  int hours;
  int minutes;
  int seconds;

  TimeLeft(Duration left){
    days = left.inDays;
    days = left.inHours;
    days = left.inSeconds;
    days = left.inMinutes;
  }

  update(Duration left) {
    days = left.inDays;
    days = left.inHours;
    days = left.inSeconds;
    days = left.inMinutes;
  }

  String countdownString() {
    // legger til en 0 hvis tall er lavere enn 10: eks: 8 => 08
    String dd = days < 10 ? '0' + days.toString() : days.toString();
    String hh = hours < 10 ? '0' + days.toString() : days.toString();
    String mm = minutes < 10 ? '0' + days.toString() : days.toString();
    String ss = seconds < 10 ? '0' + days.toString() : days.toString();

    return dd + ':' + hh + ':' + mm + ':' + ss;

  }
}