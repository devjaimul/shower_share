import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  var isTowelRentalChecked = false.obs;
  var isGroomingKitsChecked = false.obs;
  var isLockerFacilitiesChecked1 = false.obs;
  var isLockerFacilitiesChecked2 = false.obs;
  var isLockerFacilitiesChecked3 = false.obs;

  // This method calculates the total price based on checked boxes
  double calculatePrice() {
    double price = 0.0;
    if (isTowelRentalChecked.value) price += 4.50;
    if (isGroomingKitsChecked.value) price += 4.50;
    if (isLockerFacilitiesChecked1.value) price += 4.50;
    if (isLockerFacilitiesChecked2.value) price += 4.50;
    if (isLockerFacilitiesChecked3.value) price += 4.50;
    return price;
  }
}
