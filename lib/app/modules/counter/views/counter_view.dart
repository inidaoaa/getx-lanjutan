import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CounterController c = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            Text(
              'Coba klik tombol',
              style: TextStyle(fontSize: 20),
            ),
            Obx(() => Text('Di Klik: ${c.bilangan}')),
            ElevatedButton(
                onPressed: () {
                  c.increment();
                },
                child: Icon(Icons.add),
            ),
             ElevatedButton(
                onPressed: () {
                  c.decrement();
                },
                child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
