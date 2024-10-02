import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vortex/auth/auth.dart';
import 'package:vortex/auth/loging_or_register.dart';
import 'package:vortex/firebase_options.dart';
import 'package:vortex/pages/login/login_page.dart';
import 'package:vortex/pages/login/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth(),
    );
  }
}