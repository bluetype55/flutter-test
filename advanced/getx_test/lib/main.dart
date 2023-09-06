import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GET X'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<Controller>(
                init: Controller(),
                builder: (controller) =>
                    Text('Current value is : ${controller.x}'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.find<Controller>().increment();
                  },
                  child: Text('Add Number'))
            ],
          ),
        ),
      ),
    );
  }
}
