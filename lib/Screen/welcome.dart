import 'package:borderxccess/Controller/welcome_controller.dart';
import 'package:borderxccess/Screen/Auth/login.dart';
import 'package:borderxccess/Widget/bottom_sheets.dart';
import 'package:borderxccess/Widget/custom_button.dart';
import 'package:borderxccess/Widget/select_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.find<WelcomeController>();

    return Scaffold(
      appBar: AppBar(actions: const [SelectLang()]),
      body: SingleChildScrollView(
        child: SizedBox(
          height:
              MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/10776336.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5,
                  ),
                  child: Text(
                    'start_journey'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButtons.submitButton(
                  label: 'login'.tr,
                  onPressed: () {
                    Get.to(() => const LoginScreen());
                  },
                ),

                const SizedBox(height: 15),
                CustomButtons.linkButton(
                  label: 'faq_click_here'.tr,
                  onPressed: () {
                    CustomBottomSheets.showInfoBottomSheet(
                      context,
                      'FAQ is not available yet',
                    );
                  },
                ),
                Text(
                  controller.version.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
