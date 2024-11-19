import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var priceRange = 200.0.obs;
  var milesRange = 2.0.obs;
  var rating = 3.0.obs;

  var minPrice = 30.0.obs;
  var maxPrice = 400.0.obs;

  var minMiles = 0.0.obs;
  var maxMiles = 5.0.obs;

  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController minMilesController = TextEditingController();
  TextEditingController maxMilesController = TextEditingController();

  // Initialize default values for the controllers
  @override
  void onInit() {
    super.onInit();
    minPriceController.text = '\$${minPrice.value.toStringAsFixed(0)}';
    maxPriceController.text = '\$${maxPrice.value.toStringAsFixed(0)}';
    minMilesController.text = minMiles.value.toStringAsFixed(0);
    maxMilesController.text = maxMiles.value.toStringAsFixed(0);
  }

  // Update price range slider and synchronize with text fields
  void updatePriceRange(double value) {
    priceRange.value = value;
    minPrice.value = value;
    minPriceController.text = '\$${minPrice.value.toStringAsFixed(0)}';
    maxPriceController.text = '\$${maxPrice.value.toStringAsFixed(0)}';
  }

  // Update miles range slider and synchronize with text fields
  void updateMilesRange(double value) {
    milesRange.value = value;
    minMiles.value = value;
    minMilesController.text = minMiles.value.toStringAsFixed(0);
    maxMilesController.text = maxMiles.value.toStringAsFixed(0);
  }

  // Update rating slider and synchronize value
  void updateRating(double value) {
    rating.value = value; // This ensures the slider and UI reflect changes
  }

  // Handle manual input for price
  void handlePriceInput(String value, bool isMin) {
    double parsedValue = double.tryParse(value.replaceAll('\$', '')) ?? 0;
    if (isMin) {
      minPrice.value = parsedValue;
      priceRange.value = parsedValue;
    } else {
      maxPrice.value = parsedValue;
    }
  }

  // Handle manual input for miles
  void handleMilesInput(String value, bool isMin) {
    double parsedValue = double.tryParse(value) ?? 0;
    if (isMin) {
      minMiles.value = parsedValue;
      milesRange.value = parsedValue;
    } else {
      maxMiles.value = parsedValue;
    }
  }
}
