import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Stack !!!"),
        backgroundColor: const Color.fromARGB(255, 252, 2, 190),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 100,
                width: 100,
                color: Colors.blue,
              ),

              Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: 100,
                color: Colors.red,
              ),

              Container(
                margin: EdgeInsets.all(20),
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 270,
            width: 270,
            child: Stack(),
          )
        ],
      ),
    );
  }
}
