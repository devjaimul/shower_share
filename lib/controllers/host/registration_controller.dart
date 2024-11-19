import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistrationController extends GetxController {
  var homeName = ''.obs;
  var address = ''.obs;
  var details = ''.obs;
  var pricePerHour = ''.obs;
  var timeExtensionPrice = '4.50'.obs; // Default value
  var facilities = <Map<String, String>>[
    {"name": "Towel Rental", "price": "4.50"},
    {"name": "Grooming Kits", "price": "4.50"},
    {"name": "Locker Facilities", "price": "4.50"},
  ].obs;

  var startTime = const TimeOfDay(hour: 9, minute: 0).obs;
  var endTime = const TimeOfDay(hour: 21, minute: 0).obs;
  var pickedImage = Rxn<File>();

  final _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  void setStartTime(TimeOfDay time) => startTime.value = time;
  void setEndTime(TimeOfDay time) => endTime.value = time;

  void addFacility() {
    facilities.add({"name": "New Facility", "price": "0.00"});
  }
}
