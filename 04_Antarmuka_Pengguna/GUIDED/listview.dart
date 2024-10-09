import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Latihan List View !!'),
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              width: 200,
              color: const Color.fromARGB(255, 93, 34, 29),
              child: Center(
                child: Text("Type AA"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: const Color.fromARGB(255, 28, 15, 207),
              child: Center(
                child: Text("Type BB"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child: Center(
                child: Text("Type CC"),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Center(
                child: Text("Type DD"),
              ),
            ),
          ],
        ));
  }
}
