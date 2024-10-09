import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Icon(Icons.add),
                Text('gridView ke1'),
              ],
            ),
            color: Colors.amberAccent,
          ),
          
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.ac_unit),
                Text('gridView ke2'),
              ],
            ),
            color: const Color.fromARGB(255, 201, 238, 15),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke3'),
            color: const Color.fromARGB(255, 228, 9, 188),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke4'),
            color: const Color.fromARGB(255, 201, 64, 255),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke5'),
            color: const Color.fromARGB(255, 255, 64, 64),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView ke6'),
            color: const Color.fromARGB(255, 46, 66, 164),
          ),
        ],
      ),
    );
  }
}
