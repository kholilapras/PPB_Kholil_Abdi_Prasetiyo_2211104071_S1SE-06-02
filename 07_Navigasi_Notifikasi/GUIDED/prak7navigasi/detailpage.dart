import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key, required this.data});

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(child: data),
    );
  }
}
