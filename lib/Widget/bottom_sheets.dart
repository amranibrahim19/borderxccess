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

      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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

  static void showWarningBottomSheet(BuildContext context, String message) {
    showBottomSheet(
      context: context,
      title: "Warning",
      message: message,
      icon: HugeIcons.strokeRoundedAlert02,
      color: Colors.orange,
    );
  }
}
