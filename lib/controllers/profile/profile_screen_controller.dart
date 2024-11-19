import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Observable variable to track verification status
  var isVerified = false.obs;

  // Method to update verification status
  void setVerified(bool value) {
    isVerified.value = value;
  }
}
