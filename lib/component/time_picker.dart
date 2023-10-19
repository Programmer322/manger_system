import 'package:flutter/material.dart';

showAppDatePicker(BuildContext context) async {
  DateTime now = DateTime.now();
  final DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      // initialEntryMode: DatePickerEntryMode.calendarOnly
  );
  return pickDate;
}