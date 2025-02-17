import 'package:borderxccess/Controller/auth_controller.dart';
import 'package:borderxccess/Screen/welcome.dart';
import 'package:borderxccess/Widget/custom_button.dart';
import 'package:borderxccess/Widget/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final AuthController controller = Get.find<AuthController>();

    void loginPressed() {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        controller.loginSubmit(context);
      }
    }

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: Colors.black,
            size: 24.0,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'GeistMono',
                        ),
                      ),
                      const Text(
                        'Welcome back! Please login to your account',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontFamily: 'GeistMono',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInput.inputField(
                              controller: emailController,
                              label: 'Email',
                              hint: 'Enter your email',
                              inputType: TextInputType.emailAddress,
                              isPassword: false,
                              icon: Icons.email,
                              isEmail: true,
                            ),
                            const SizedBox(height: 32.0),
                            CustomInput.inputField(
                              controller: passwordController,
                              label: 'Password',
                              hint: 'Enter your password',
                              inputType: TextInputType.visiblePassword,
                              isPassword: true,
                              icon: Icons.lock,
                              isEmail: false,
                            ),
                            const SizedBox(height: 24.0),
                          ],
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print('Forgot Password');
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      CustomButtons.submitButton(
                        label: 'Login',
                        onPressed: () => loginPressed(),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              ' Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
