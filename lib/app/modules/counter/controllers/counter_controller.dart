import 'package:get/get.dart';

class CounterController extends GetxController {
  final bilangan = 0.obs;

  void increment() {
    if (bilangan.value >= 20) {
      Get.snackbar('Warning', 'Loba teing');
    } else {
      bilangan.value++;
    }
  }

  void decrement() {
    if (bilangan.value <= 0) {
      Get.snackbar('Warning', 'ai sia kunaon');
    } else {
      bilangan.value--;
    }
  }
}
