import 'package:get/get.dart';

class ConfirmDetailsController extends GetxController {
  RxDouble extraTime = 0.5.obs;
  RxDouble pricePerHour = 20.0.obs;
  RxDouble calculatedPrice = 10.0.obs;

  void updateExtraTime(double value) {
    extraTime.value = value;
    calculatedPrice.value = (extraTime.value * pricePerHour.value).toDouble();
  }
}