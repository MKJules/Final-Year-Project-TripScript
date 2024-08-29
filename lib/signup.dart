import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trip_script/consts/snackbar.dart';
import 'package:trip_script/dashboard.dart';
import 'package:trip_script/models/user.dart';
import 'package:trip_script/providers/user_provider.dart';
import 'package:trip_script/services/auth_service.dart';
import 'package:trip_script/sign_in.dart';
import 'package:uuid/uuid.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Center(
                  child: SvgPicture.asset(
                    'images/sign_up.svg',
                    height: 315.w,
                    width: 232.h,
                  ),
                ),
              ),
              Container(
                height: 716.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Create an account, it\'s free',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            if (formKey.currentState!.validate()) {}

                            setState(() {
                              isPressed = true;
                            });

                            String name = nameController.text;
                            String email = emailController.text.trim();
                            String password = passwordController.text;
                            User user = User(
                              uid: const Uuid().v4(),
                              name: name,
                              imagePath:
                                  'https://images.app.goo.gl/1LFDVPPEt32MSYuKA',
                              email: email,
                              phoneNumber: '',
                              emergencyNumber: '',
                            );
                            await AuthService.signUp(user, password, context);
                            await userProvider.createUser(user);

                            showCustomSnackbar(
                                'Registration complete', context);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Dashboard();
                                },
                              ),
                            );

                            setState(() {
                              isPressed = false;
                            });
                          } catch (error) {
                            setState(() {
                              isPressed = false;
                            });
                            log("Error: $error");
                            showCustomSnackbar('Error: $error', context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          fixedSize: Size(370.w, 60.h),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                        ),
                        child: isPressed
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Sign Up'),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style: TextStyle(
                              color: const Color.fromRGBO(149, 149, 149, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                              ); // Navigate to sign in screen
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
