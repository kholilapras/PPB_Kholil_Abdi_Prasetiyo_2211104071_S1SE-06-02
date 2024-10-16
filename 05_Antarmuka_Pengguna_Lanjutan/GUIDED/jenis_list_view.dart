import 'package:flutter/material.dart';

class JenisListView extends StatelessWidget {
  const JenisListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Jenis List View'),
          backgroundColor: const Color.fromARGB(255, 9, 236, 236),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blue[colorCodes[index]],
              child: Center(
                child: Text("Entry ${entries[index]}"),
              ),
            );
          },
          itemCount: entries.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10,
              color: const Color.fromARGB(255, 2, 14, 246),
            );
          },
        ));
  }
}
