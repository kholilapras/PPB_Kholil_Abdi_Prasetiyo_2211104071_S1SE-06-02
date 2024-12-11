import 'package:flutter/material.dart';
import 'package:prak13ppb/view/detail_page.dart';
import 'package:prak13ppb/view/my_home_page.dart';
import 'package:prak13ppb/view model/counter_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name:'/', 
          page: ()=> MyHomePage(title: 'Belajar GetX'),
        ),
        GetPage(
          name:'/detail', 
          page: ()=> DetailPage(),
        ),
      ],
    );
  }
}