import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getsnackbar(){
    Get.snackbar(
      'GetX Snackbar',
      'Ini Snackbar', 
      colorText: Colors.white, 
      backgroundColor: Colors.green,
      );
  }

  void getdialog() {
    Get.defaultDialog(
      title: 'GetX Dialog',
      middleText: 'Ini dialog'
      );
  }

  void getbottomsheet(){
    Get.bottomSheet(Container(
      height: 70,
      width: double.infinity,
      color: Colors.amber,
      child: Text('Ini adalah Bottom Sheet'),
    )
    );
  }
}