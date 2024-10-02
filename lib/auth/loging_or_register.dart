import 'package:flutter/material.dart';
import 'package:vortex/pages/login/login_page.dart';
import 'package:vortex/pages/login/register_page.dart';

class LogingOrRegister extends StatefulWidget {
  const LogingOrRegister({super.key});

  @override
  State<LogingOrRegister> createState() => _LogingOrRegisterState();
}

class _LogingOrRegisterState extends State<LogingOrRegister> {

  bool showLoginPage = true ;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage ? LoginPage(onToggle: togglePages) : RegisterPage(onToggle: togglePages);
  }
}