import 'package:book_app/core/widgets/custom_loginbotton.dart';
import 'package:book_app/core/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Get Started",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Please fill your details to login.",
                      style: TextStyle(fontSize: 16, color: Color(0xFF252525)),
                    ),

                    const SizedBox(height: 30),

                    const CustomTextForm(
                      labelText: "Username/Email",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 30),

                    const CustomTextForm(
                      labelText: "Password",
                      icon: Icons.lock,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),

                    const SizedBox(height: 40),

                    CustomLoginbotton(
                      text: "Login",
                      onPressed: () {
                        // Login action
                      },
                    ),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF121212),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 14, color: Color(0xFF252525)),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RegisterView());
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF121212),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40), 
          ],
        ),
      ),
    );
  }
}
