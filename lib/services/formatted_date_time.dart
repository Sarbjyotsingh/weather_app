import 'package:intl/intl.dart';

class FormattedDateTime {
  DateTime dateTime;
  FormattedDateTime({this.dateTime});

  String getDeviceLocationFormattedDateTime() {
    print(DateTime.fromMillisecondsSinceEpoch(1 * 1000));
//    print(dateTime.timeZoneOffset);
    return DateFormat('EEE, h:mm a').format(dateTime);
  }
}
