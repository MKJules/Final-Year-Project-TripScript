import 'package:firebase_auth/firebase_auth.dart';

String email = FirebaseAuth.instance.currentUser!.email.toString();