import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void favCounter() {
    if (fav.value == 1) {
      Get.snackbar(
        'Already Loved It',
        'You Already Loved It',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      fav.value++;
      Get.snackbar(
        'Loved It',
        'You just loved it',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    debugPrint(fav.value.toString());
  }
}
