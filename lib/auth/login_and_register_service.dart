import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseLoginService {

  static void signIn(String email, String password, Function(String message) onError, BuildContext context) async {
    showDialog(
      context: context, 
      builder: (context) => const Center(child: CircularProgressIndicator(),)
      );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: password
      );  

      if(context.mounted) Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      
      if(context.mounted) Navigator.pop(context);

      String mensajeLimpio = e.toString().replaceAll(RegExp(r'\[.*?\]'), '').trim();
      onError(mensajeLimpio);
      print("Error signin in: \n Error Code: ${e.code} \n Error: $e ");
    }
    
  }

  static void signOut() async {
    await FirebaseAuth.instance.signOut();
  }




}