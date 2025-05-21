import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getTodayName() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE').format(now);

  return formattedDate;
}

String getWeekDayAndFormattedDate(DateTime date) {
  String formattedDate = DateFormat('EEEE, MMMM d').format(date);
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

String getDateAtMidnight(DateTime date) {
  DateTime dateOnly = DateTime(date.year, date.month, date.day);
  return dateOnly.toString();
}

String formatTime(TimeOfDay time) {
  final hour = time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}
