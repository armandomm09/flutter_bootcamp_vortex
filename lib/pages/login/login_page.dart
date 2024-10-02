import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:vortex/auth/login_and_register_service.dart';
import 'package:vortex/constants.dart';
import 'package:vortex/widgets/app_button.dart';
import 'package:vortex/widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  final Function() onToggle;
  LoginPage({super.key, required this.onToggle});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void displayMessage(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  meshGrid(BuildContext context) {
    late final AnimatedMeshGradientController _controller =
        AnimatedMeshGradientController();
    _controller.start();
    return Center(
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: AnimatedMeshGradient(
            colors: [
              colorBG,
              colorMainBlue,
              colorDrawer,
              colorMainPurple,
            ],
            options: AnimatedMeshGradientOptions(speed: 1),
            controller: _controller,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
      body: Stack(
        children: [
          meshGrid(context),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  SvgPicture.asset(
                    "assets/logo.svg",
                    height: 150,
                    // ignore: deprecated_member_use
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    // colorBlendMode: BlendMode.darken,
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  //welcome back
                  Text(
                    "Welcome back!!!",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),

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

                  // AppButton(
                  //   "Log In",
                  // ),
                  GestureDetector(
                    onTap: () => FirebaseLoginService.signIn(
                        emailController.text,
                        passwordController.text,
                        (message) => displayMessage(message, context),
                        context),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: onToggle,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
