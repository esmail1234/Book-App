import 'package:get/get.dart';
import 'package:book_app/core/routes/app_routes.dart';

class SplashController extends GetxController {
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
      Get.offNamed(Routes.home);
    });
  }
}
