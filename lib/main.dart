import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trip_script/details_screen.dart';
import 'package:trip_script/home1.dart';
import 'package:trip_script/onboarding1.dart';
import 'package:trip_script/providers/user_provider.dart';

import 'dashboard.dart';
import 'firebase_options.dart';
// import 'package:trip_script/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScreenUtilInit(
    designSize: const Size(430, 932),
    builder: (_, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: Colors.black,
        ),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/details': (context) => const DetailsPage(),
        },
        home: FirebaseAuth.instance.currentUser == null
            ? const OnboardingScreen1()
            : const Dashboard(),
      ),
    );
  }
}
