import 'package:flutter/material.dart';

Future<DateTime?> selectDateOnDatePicker(BuildContext context, selectedDate, [DateTime? lastDate]) async {
  DateTime? date = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: lastDate ?? DateTime(DateTime.now().year, DateTime.now().month + 1, 15)
  );
  return date;
}