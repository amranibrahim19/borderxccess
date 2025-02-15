import 'package:borderxccess/Controller/welcome_controller.dart';
import 'package:borderxccess/Widget/bottom_sheets.dart';
import 'package:borderxccess/Widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_flags/country_flags.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.find<WelcomeController>();

    final List<Map<String, String>> languages = [
      {'code': 'en', 'name': 'English', 'flag': 'us'},
      {'code': 'id', 'name': 'Indonesia', 'flag': 'id'},
      {'code': 'vi', 'name': 'Vietnamese', 'flag': 'vn'},
      {'code': 'zh', 'name': 'Chinese', 'flag': 'zh'},
      {'code': 'th', 'name': 'Thai', 'flag': 'th'},
      {'code': 'ko', 'name': 'Korean', 'flag': 'kr'},
      {'code': 'ja', 'name': 'Japanese', 'flag': 'jp'},
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              value: Get.locale?.languageCode,
              onChanged: (String? value) {
                if (value != null) {
                  Get.updateLocale(Locale(value));
                }
              },
              items:
                  languages.map((language) {
                    return DropdownMenuItem<String>(
                      value: language['code'],
                      child: Row(
                        children: [
                          CountryFlag.fromLanguageCode(
                            language['code']!,
                            width: 24,
                            height: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(language['name']!),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
      body: Obx(
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
                'welcome_message'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: CustomButtons.submitButton(
                label: 'login'.tr,
                onPressed: () {
                  // Get.toNamed('/login');
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 15),
            CustomButtons.linkButton(
              label: 'faq'.tr,
              onPressed: () {
                CustomBottomSheets.showWarningBottomSheet(
                  context,
                  'FAQ is not available yet',
                );
              },
            ),
            const Spacer(),
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
    );
  }
}
