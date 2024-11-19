import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  var selectedDate = Rx<DateTime?>(null);
  var selectedStartTime = Rx<TimeOfDay?>(null);
  var selectedEndTime = Rx<TimeOfDay?>(null);

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future<void> pickTime(BuildContext context, {required bool isStartTime}) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      if (isStartTime) {
        selectedStartTime.value = picked;
      } else {
        selectedEndTime.value = picked;
      }
    }
  }
}
