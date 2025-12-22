import 'package:book_app/features/login/login_view.dart';
import 'package:book_app/features/register/register_view.dart';
import 'package:get/get.dart';
import '../../features/splash/splash_view.dart';
import '../../features/home/home_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => SplashView()),
    GetPage(name: Routes.home, page: () => HomeView()),
    GetPage(name: Routes.login, page: () => LoginView()),
    GetPage(name: Routes.register, page: () => RegisterView()),
  ];
}
