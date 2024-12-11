import 'package:flutter/material.dart';
import 'package:prak13ppb/view model/counter_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              controller.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/detail');
                },
                child: Text('Go to Detail Page'))
          ],
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: controller.getsnackbar,
            tooltip: 'Snackbar',
            child: const Icon(Icons.chat),
          ),
          FloatingActionButton(
            onPressed: controller.getdialog,
            tooltip: 'Dialog',
            child: const Icon(Icons.notifications),
          ),
          FloatingActionButton(
            onPressed: controller.getbottomsheet,
            tooltip: 'Bottom Sheet',
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}