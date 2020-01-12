import 'package:intl/intl.dart';

class FormattedDateTime {
  DateTime dateTime;
  FormattedDateTime({this.dateTime});

  String getDeviceLocationFormattedDateTime() {
    return DateFormat('EEE, h:mm a').format(dateTime);
  }
}
