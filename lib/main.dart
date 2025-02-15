import 'package:borderxccess/Binding/app_binding.dart';
import 'package:borderxccess/Localization/app_localization.dart';
import 'package:borderxccess/Screen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BorderXcess',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          secondary: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
      initialBinding: AppBinding(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      translations: AppLocalization(),
      home: const WelcomeScreen(),
    );
  }
}
