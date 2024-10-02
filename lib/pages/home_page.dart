import 'package:flutter/material.dart';
import 'package:vortex/auth/login_and_register_service.dart';
import 'package:vortex/constants.dart';
import 'package:vortex/widgets/app_drawer.dart';
import 'package:vortex/widgets/post_clip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const caption1 =
        "How far can black hole jets extend? A new record was found just recently with the discovery of a 23-million light-year long jet pair from a black hole active billions of years ago. Dubbed Porphyrion for a mythological Greek giant, the impressive jets were created by a type of black hole that does not usually create long jets -- one that is busy creating radiation from infalling gas.";

    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: colorBG,
      
      body: ListView.builder(
          itemCount: postsJson.length,
          itemBuilder: (context, index) {
            var currentPost = postsJson[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: PostClip(
                  username: currentPost["username"].toString(),
                  caption: currentPost["caption"].toString(),
                  likes: currentPost["likes"].toString(),
                  comments: currentPost["comments"].toString(),
                  shares: currentPost["shares"].toString(),
                  image: currentPost["image"].toString()),
            );
          }),
    );
  }
}
