import 'package:get/get.dart';
import '../home/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const HomeView()); 
    });
  }
}
