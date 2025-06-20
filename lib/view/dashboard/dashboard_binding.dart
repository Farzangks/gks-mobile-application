import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/dashboard_controller.dart';
import 'package:ghar_ka_sathi/controller/ratting_controller.dart';
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(RatingController(), permanent: true);
  }
}