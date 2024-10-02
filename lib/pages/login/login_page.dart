import 'package:flutter/material.dart';
import 'package:vortex/auth/login_and_register_service.dart';
import 'package:vortex/widgets/app_button.dart';
import 'package:vortex/widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  final Function() onToggle;
  LoginPage({super.key, required this.onToggle});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                Text("Welcome back!!!"),

                SizedBox(
                  height: 50,
                ),

                //email textfield
                AppTextField(
                    controller: emailController,
                    hintText: "Email...",
                    obscureText: false),

                //password textfield
                SizedBox(
                  height: 30,
                ),

                //email textfield
                AppTextField(
                    controller: passwordController,
                    hintText: "Password...",
                    obscureText: true),

                SizedBox(
                  height: 30,
                ),

                AppButton(
                  "Log In",
                  onTap: () => FirebaseLoginService.signIn(emailController.text, passwordController.text, (message) => displayMessage(message, context), context),
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                    ),
                    GestureDetector(
                      onTap: onToggle,
                        child: Text(
                      "Sign Up",
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
