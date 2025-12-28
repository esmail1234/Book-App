import 'package:book_app/features/login/login_binding.dart';
import 'package:book_app/features/login/login_view.dart';
import 'package:book_app/features/register/register_binding.dart';
import 'package:book_app/features/register/register_view.dart';
import 'package:book_app/features/splash/splash_binding.dart';
import 'package:book_app/features/welcome/welcome_page.dart';
import 'package:get/get.dart';
import '../../features/splash/splash_view.dart';
import '../../features/home/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView()
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
