import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'ini bekerja',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
            Get.toNamed('/counter');
          },
          child: Text('Pindah ke halaman Counter'),
          ),
          ElevatedButton(
            onPressed: () {
            Get.toNamed('/formulir');
          },
          child: Text('Pindah ke halaman Formulir'),
          ),
        ],
      ),
    );
  }
}
