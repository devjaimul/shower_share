import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditDetailController extends GetxController {
  var selectedImage = Rx<File?>(null); // To hold the picked image
  final formKey = GlobalKey<FormState>(); // For form validation

  // Methods to pick image
  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  // Method to pick date
  Future<void> pickDate(BuildContext context, TextEditingController dobController) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  // Method to validate the form
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
