// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void register() async {
  FocusManager.instance.primaryFocus?.unfocus();

  if (!registerFormKey.currentState!.validate()) return;

  isLoading.value = true;

  try {
    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    Get.snackbar(
      "Success",
      "Registration Successful",
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.offAllNamed('/login'); 

    print("User Registered: ${userCredential.user!.email}");
  } on FirebaseAuthException catch (e) {
    String message = 'Registration failed';
    if (e.code == 'email-already-in-use') {
      message = 'Email is already in use';
    } else if (e.code == 'weak-password') {
      message = 'Password is too weak';
    } else if (e.code == 'invalid-email') {
      message = 'Invalid email address';
    }

    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  } catch (e) {
    Get.snackbar(
      "Error",
      "Something went wrong",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  } finally {
    isLoading.value = false;
  }
}


  @override
  void onClose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void goToLogin() {
    Get.back();
  }
}
