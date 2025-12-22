import 'package:book_app/core/widgets/custom_loginbotton.dart';
import 'package:book_app/core/widgets/custom_textform.dart';
import 'package:book_app/features/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Register",
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
                    const SizedBox(height: 30),
                    
                    const Text(
                      "Please fill your details to signup.",
                      style: TextStyle(fontSize: 16, color: Color(0xFF252525)),
                    ),
                    
                    const SizedBox(height: 30),

                    const CustomTextForm(
                      labelText: "Username",
                      icon: Icons.verified_user_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),

                    const SizedBox(height: 30),

                    const CustomTextForm(
                      labelText: "Email",
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
                    
                    const SizedBox(height: 30),

                    const CustomTextForm(
                      labelText: "Confirm Password",
                      icon: Icons.lock,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),

                    const SizedBox(height: 40),

                    CustomLoginbotton(
                      text: "Register",
                      onPressed: (){
                        
                      }, // Register action
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already a member? ",
                  style: TextStyle(fontSize: 14, color: Color(0xFF252525)),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const LoginView());
                  },
                  child: const Text(
                    "Sign In",
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
