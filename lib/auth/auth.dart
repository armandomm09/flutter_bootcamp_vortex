import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vortex/auth/loging_or_register.dart';
import 'package:vortex/pages/home_page.dart';
import 'package:vortex/widgets/app_nav_bar.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          return snapshot.hasData ? MyNavBar() : LogingOrRegister();
        }
        ),
    );
  }
}
