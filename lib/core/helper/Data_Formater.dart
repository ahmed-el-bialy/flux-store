import 'package:intl/intl.dart';

String dateFormater(String rawDate) {
  DateTime dateTime = DateTime.parse(rawDate);

  return DateFormat('yyyy-MM-dd').format(dateTime);
  // النتيجة هتكون مثلاً: 2025-04-30
}