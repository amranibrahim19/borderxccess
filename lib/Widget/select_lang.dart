import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLang extends StatefulWidget {
  const SelectLang({super.key});

  @override
  State<SelectLang> createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English', 'flag': 'us'},
    {'code': 'id', 'name': 'Indonesia', 'flag': 'id'},
    {'code': 'vi', 'name': 'Vietnamese', 'flag': 'vn'},
    {'code': 'zh', 'name': 'Chinese', 'flag': 'zh'},
    {'code': 'th', 'name': 'Thai', 'flag': 'th'},
    {'code': 'ko', 'name': 'Korean', 'flag': 'kr'},
    {'code': 'ja', 'name': 'Japanese', 'flag': 'jp'},
    {'code': 'ky', 'name': 'Kyrgyzstang', 'flag': 'kg'},
    {'code': 'ru', 'name': 'Russian', 'flag': 'ru'},
    {'code': 'ja', 'name': 'Japanese', 'flag': 'jp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
