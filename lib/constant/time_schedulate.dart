import 'package:intl/intl.dart';

class TimeFormatNow {
  String dateFormatGAY(DateTime dateTime) {
    String date = DateFormat.MMMEd().format(dateTime);
    return date;
  }}