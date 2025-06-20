import 'package:get/get.dart';
import 'package:ghar_ka_sathi/route/app_route.dart';
import 'package:ghar_ka_sathi/src/splash_screen.dart';
import 'package:ghar_ka_sathi/view/dashboard/dashboard_binding.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () =>  const SplashScreen(),
        binding: DashboardBinding()
    ),
  ];
}