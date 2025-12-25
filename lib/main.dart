import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY']!,
      appId: dotenv.env['FIREBASE_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
      authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN'],
      measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID'],
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}
