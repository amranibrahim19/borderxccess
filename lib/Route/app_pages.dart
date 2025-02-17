import 'package:borderxccess/Screen/Auth/login.dart';
import 'package:borderxccess/Screen/welcome.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.WELCOME, page: () => const WelcomeScreen()),
    GetPage(name: AppRoutes.LOGIN, page: () => const LoginScreen()),
  ];
}
