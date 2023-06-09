import 'package:get/get.dart';
import 'package:tourease/routes/app_routes.dart';

class SplashController extends GetxController {
  double? height;
  double? width;
  @override
  void onInit() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Get.offAllNamed(AppRoute.TUTORIAL);
    });

    super.onInit();
  }
}
