import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomBottomSheets {
  static void showBottomSheet({
    required BuildContext context,
    required String title,
    required String message,
    required IconData icon,
    required Color color,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    HugeIcon(icon: icon, color: color, size: 24.0),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const HugeIcon(
                        icon: HugeIcons.strokeRoundedCancelCircle,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showErrorBottomSheet(BuildContext context, String message) {
    showBottomSheet(
      context: context,
      title: "Error",
      message: message,
      icon: Icons.error,
      color: Colors.red,
    );
  }

  static void showSuccessBottomSheet(BuildContext context, String message) {
    showBottomSheet(
      context: context,
      title: "Success",
      message: message,
      icon: Icons.check_circle,
      color: Colors.green,
    );
  }

  static void showInfoBottomSheet(BuildContext context, String message) {
    showBottomSheet(
      context: context,
      title: "Info",
      message: message,
      icon: HugeIcons.strokeRoundedAlert02,
      color: Colors.lightBlue,
    );
  }
}
