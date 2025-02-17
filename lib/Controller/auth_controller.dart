import 'package:borderxccess/Services/api_services.dart';
import 'package:borderxccess/Widget/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;
  var isSignUp = false.obs;

  final ApiServices apiServices;

  AuthController({required this.apiServices});

  void loginSubmit(BuildContext context) async {
    isLogin.value = !isLogin.value;
    await apiServices.login('email', 'password');

    CustomBottomSheets.showInfoBottomSheet(context, 'Login Success');
  }

  void changeSignUp() {
    isSignUp.value = !isSignUp.value;
  }
}
