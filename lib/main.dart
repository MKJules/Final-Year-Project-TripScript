import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_script/details_screen.dart';
import 'package:trip_script/home1.dart';
import 'package:trip_script/onboarding1.dart';
// import 'package:trip_script/signup.dart';

void main() {
  runApp(
      ScreenUtilInit(
        designSize: const Size(430,932),
        builder: (_, child) => const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen1(),
        '/home': (context) => const HomeScreen(),
        '/details': (context) => const DetailsPage(),  // DetailsPage route
      },
    );
  }
}
