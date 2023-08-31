import 'package:get/get.dart';

import '../../../components/config/app_route.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    toHomeScreen();
    super.onInit();
  }

  void toHomeScreen() {
    Future.delayed(const Duration(seconds: 2)).then(
        (value) => Get.offNamedUntil(AppRoute.homeScreen, (route) => false));
  }
}
