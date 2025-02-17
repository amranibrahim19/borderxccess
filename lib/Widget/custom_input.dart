// generate custom input field

import 'package:flutter/material.dart';

class CustomInput {
  static Widget inputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required TextInputType inputType,
    required bool isPassword,
    required IconData icon,
    required bool isEmail,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SizedBox(
        height: 70,
        width: 350,
        child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter $label';
            } else if (isEmail && !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ),
    );
  }
}
