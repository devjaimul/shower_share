import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  final RxSet<Marker> markers = <Marker>{}.obs; // Use RxSet for sets
  final Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  final RxString searchAddress = ''.obs;
  Position? currentPosition;

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(-6.2088, 106.8456),
    zoom: 14.0,
  );

  final List<String> locationList = [
    "Brett Gomez House",
    "Lucky Lot Thai Spa",
    "East West University",
    "Z One Thai Spa"
  ];

  final List<LatLng> locations = [
    LatLng(-6.2088, 106.8456),
    LatLng(-6.2087, 106.8455),
    LatLng(-6.2089, 106.8460),
    LatLng(-6.2090, 106.8465),
  ];

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied.');
      return;
    }

    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    markers.add(
      Marker(
        markerId: MarkerId('currentLocation'),
        position: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        infoWindow: InfoWindow(title: 'You are here'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );

    await goToCurrentLocation();
  }

  Future<void> goToCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    if (currentPosition != null) {
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        zoom: 14.0,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  Future<void> onMapTapped(LatLng location) async {
    String? address = await _getAddressFromLatLng(location);
    selectedLocation.value = location;

    markers.add(
      Marker(
        markerId: MarkerId('selectedLocation'),
        position: location,
        infoWindow: InfoWindow(title: 'Selected Location'),
      ),
    );

    if (address != null) {
      searchAddress.value = address;
    }
  }

  Future<String?> _getAddressFromLatLng(LatLng latLng) async {
    List<Placemark> placemarks =
    await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return '${place.locality}, ${place.country}';
    }
    return null;
  }
}
