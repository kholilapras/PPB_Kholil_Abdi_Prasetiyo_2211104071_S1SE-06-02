import 'package:flutter/material.dart';
import 'package:guided5/custom.dart';
import 'package:guided5/flexible_expanded.dart';
import 'package:guided5/jenis_list_view.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Custom(),
    );
  }
}
