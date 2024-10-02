import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vortex/constants.dart';

const colorText = Colors.white;
const primaryColor = Colors.green;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Background image
                  Container(
                    height: 500,
                    decoration: const BoxDecoration(
                      // gradient: LinearGradient(colors: [colorBG, Color.fromARGB(255, 228, 16, 16)]),
                      image: DecorationImage(
                        image: AssetImage("assets/space6.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    height: 500,
                    width: double.infinity,
                      decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                        colors: [colorBG, Colors.transparent]),
                  )),
                  // Profile avatar
                  const Positioned(
                    top: 50,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/profilepic.jpg'),
                    ),
                  ),

                   Positioned(
                    top: 200,
                     child: Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 20),
                                     child: Column(
                                       children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "@rickacidd",
                            style: TextStyle(
                              color: colorText,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.verified,
                            color: primaryColor,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Photographer | Visual designer",
                        style: TextStyle(
                          color: colorText,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border_outlined, color: colorText),
                          SizedBox(width: 5),
                          Text("1.2k", style: TextStyle(color: colorText)),
                          SizedBox(width: 20),
                          Icon(Icons.groups_outlined, color: colorText),
                          SizedBox(width: 5),
                          Text("3k", style: TextStyle(color: colorText)),
                          SizedBox(width: 20),
                          Icon(Icons.photo_outlined, color: colorText),
                          SizedBox(width: 5),
                          Text("351", style: TextStyle(color: colorText)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Follow"),
                          ),
                          const SizedBox(width: 10),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Message",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Social links
                      const Text(
                        "@t.me/rickacidd | https://www.rickacidd.com",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                                       ],
                                     ),
                                   ),
                   ),
                ],
              ),
              // const SizedBox(height: 10), // Space for the avatar overlap
              // Username and follow/message buttons
             
              // Grid of images
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/space$index.jpg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
