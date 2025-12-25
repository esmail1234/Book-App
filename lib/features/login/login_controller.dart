// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  void login() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState!.validate()) {
      print("Login Successful");
      print(emailController.text);
      print(passwordController.text);
    }
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void goToForgotPassword() {
  Get.snackbar(
    'Info',
    'Forgot Password screen not implemented yet',
    snackPosition: SnackPosition.BOTTOM,
  );
}

}
