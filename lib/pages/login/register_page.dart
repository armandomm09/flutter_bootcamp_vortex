import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vortex/widgets/app_button.dart';
import 'package:vortex/widgets/app_text_field.dart';

class RegisterPage extends StatelessWidget {
  final Function() onToggle;
  RegisterPage({super.key, required this.onToggle});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  void signUp(BuildContext context) async {
    showDialog(
      context: context, 
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      )
      );

      if(passwordController.text != confirmPasswordController.text){
        Navigator.pop(context);
        displayMessage("Passwords  don't match", context);
        return;
      }

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);

        if(context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        displayMessage(e.code, context);
      }
  }

  void displayMessage(String message, BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(title: Text(message),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),

                SizedBox(
                  height: 50,
                ),
                //welcome back
                Text("Let's create an account for you"),

                SizedBox(
                  height: 50,
                ),

                //email textfield
                AppTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),

                //password textfield
                SizedBox(
                  height: 30,
                ),

                //email textfield
                AppTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),

                SizedBox(
                  height: 30,
                ),

                AppTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true),

                SizedBox(
                  height: 30,
                ),

                AppButton(
                  "Register",
                  onTap: () => signUp(context),
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Al ready have an account...? ",
                    ),
                    GestureDetector(
                      onTap: onToggle,
                        child: Text(
                      "Log In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
