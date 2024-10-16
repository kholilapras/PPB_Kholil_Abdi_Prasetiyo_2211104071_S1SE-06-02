import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible vs Expanded'),
        backgroundColor: const Color.fromARGB(188, 7, 48, 255),
      ),
      body: Column(
        children: [
          
          Text("Flexible"),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: Colors.blue,
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(189, 8, 216, 244),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Flexible takes up the remaining space but can shrink if needed.",
                    ),
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          const SizedBox(height: 20),
          
          Text("Expanded"),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 4, 193, 240),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(199, 5, 127, 220),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Expanded forces the widget to take up all the remaining space.",
                    ),
                  ),
                ),
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          ),
        ],
      ),
    );
  }
}
