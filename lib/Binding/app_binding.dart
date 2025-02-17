import 'package:borderxccess/Controller/auth_controller.dart';
import 'package:borderxccess/Controller/welcome_controller.dart';
import 'package:borderxccess/Services/api_services.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
    Get.lazyPut<ApiServices>(() => ApiServices());
    Get.lazyPut<AuthController>(
      () => AuthController(apiServices: Get.find<ApiServices>()),
    );
  }
}
