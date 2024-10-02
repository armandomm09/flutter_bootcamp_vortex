
import 'package:flutter/material.dart';
import 'package:vortex/constants.dart';
import 'package:vortex/pages/home_page.dart';
import 'package:vortex/pages/new_post_page.dart';
import 'package:vortex/pages/profile_page.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const NewPostPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      appBar: AppBar(
        title: const Text(
          "VORTEX",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24, // Tamaño de fuente más grande para el título
            color: Color.fromARGB(
                255, 135, 0, 180), // Morado fuerte para el título
          ),
        ),
        centerTitle: true, // Centrar el título
        backgroundColor:
            colorBG, // Hacer transparente el fondo del AppBar
        elevation: 0, // Sin sombra
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.blueAccent,
                    width: 2), // Añadir borde para resaltar la imagen de perfil
                image: const DecorationImage(
                  image: AssetImage("assets/profilepic.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorBG,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'New Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Profile',
          ),
         
        ],
      ),
    );
  }
}