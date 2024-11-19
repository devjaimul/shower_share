import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VerifyNidController extends GetxController {
  var frontImagePath = ''.obs;
  var backImagePath = ''.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage({required bool isFront}) async {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a photo'),
              onTap: () async {
                final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  if (isFront) {
                    frontImagePath.value = image.path;
                  } else {
                    backImagePath.value = image.path;
                  }
                }
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              onTap: () async {
                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  if (isFront) {
                    frontImagePath.value = image.path;
                  } else {
                    backImagePath.value = image.path;
                  }
                }
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
