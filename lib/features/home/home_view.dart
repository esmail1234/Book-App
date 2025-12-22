import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, // مهم جداً عشان تسمح بخروج الصورة
              children: [
                Container(
                  height: 450,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  bottom: -70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      "assets/images/splash_screen.png",
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Read more and stress less with our online book shopping app. "
                "Shop from anywhere you are and discover titles that you love. "
                "Happy reading!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 80),

            Container(
              height: 56,
              width: 320,
              color: Color(0xFF121212),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF2F2F2),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 10),

            TextButton(
              onPressed: () {},
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
