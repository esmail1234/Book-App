import 'package:get/get.dart';

import '../../features/splash/splash_view.dart';
import '../../features/splash/splash_binding.dart';
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
      name: Routes.home,
      page: () => HomeView(),
    ),
  ];
}
