import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getTodayName() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE').format(now);

  return formattedDate;
}

String formatDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('EEEE, MMMM d').format(dateTime);
  return formattedDate;
}

bool isToday(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

bool isYesterday(DateTime date) {
  final now = DateTime.now();
  final yesterday =
      DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));
  final inputDate = DateTime(date.year, date.month, date.day);

  return inputDate == yesterday;
}

bool isTomorrow(DateTime date) {
  final now = DateTime.now();
  final tomorrow =
      DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
  final inputDate = DateTime(date.year, date.month, date.day);

  return inputDate == tomorrow;
}

bool isTwoDaysAreEqual(DateTime date1, DateTime date2) {
  final inputDate1 = DateTime(date1.year, date1.month, date1.day);
  final inputDate2 = DateTime(date2.year, date2.month, date2.day);
  return inputDate1 == inputDate2;
}

String getDateAtMidnight(String stringDate) {
  final DateTime date = DateTime.parse(stringDate);
  DateTime dateOnly = DateTime(date.year, date.month, date.day);
  return dateOnly.toString();
}

String formatTimeOfDay(String time) {
  if (time.isEmpty) return '';
  final timeOfDay = _parseTimeOfDay(time);
  final hour = timeOfDay.hourOfPeriod;
  final minute = timeOfDay.minute.toString().padLeft(2, '0');
  final period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

  if (minute == '00') {
    return '$hour $period';
  } else {
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }
}

TimeOfDay _parseTimeOfDay(String timeString) {
  // Example input: "TimeOfDay(21:00)"
  final timePart = timeString.replaceAll(RegExp(r'[^\d:]'), ''); // "2100"
  final parts = timePart.split(':');
  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}
