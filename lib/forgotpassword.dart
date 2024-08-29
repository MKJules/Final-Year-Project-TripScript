import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_script/consts/snackbar.dart';
import 'package:trip_script/services/auth_service.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

@override
Widget build(BuildContext context) {
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
                  'images/forgot_password.svg',
                  height: 250.w,
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
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please enter your email for sending OTP',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: emailController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'youremail@whatever.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () async{
                        try{
                          String email = emailController.text.trim();
                          await AuthService.forgotPassword(email, context);

                          Navigator.pop(context);
                        }
                        catch(error){
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
                      child: const Text('Send'),
                    ),
                    const SizedBox(height: 16),
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
