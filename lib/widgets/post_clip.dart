import 'package:flutter/material.dart';

class PostClip extends StatefulWidget {
  final String image;
  final String username;
  final String caption;
  final String likes;
  final String comments;
  final String shares;
  const PostClip({super.key, required this.username, required this.caption, required this.likes, required this.comments, required this.shares, required this.image});

  @override
  State<PostClip> createState() => _PostClipState();
}

class _PostClipState extends State<PostClip> {
  bool isExpanded = false;
  // Para manejar si el texto está expandido o no
  @override
  Widget build(BuildContext context) {
    const caption1 =
        "How far can black hole jets extend? A new record was found just recently with the discovery of a 23-million light-year long jet pair from a black hole active billions of years ago. Dubbed Porphyrion for a mythological Greek giant, the impressive jets were created by a type of black hole that does not usually create long jets -- one that is busy creating radiation from infalling gas.";

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image:  DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/profilepic.jpg",
                            ),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.username,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Texto que puede expandirse y contraerse
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isExpanded
                        ? widget.caption // Texto completo si está expandido
                        : '${widget.caption.substring(0, 100)}...', // Texto truncado si no
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? "Show less" : "Show more",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.favorite_border_outlined,
                            size: 30, weight: 100, color: Colors.white),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.likes,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.chat_bubble_outline,
                          size: 30,
                          weight: 100,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.comments,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.share,
                          size: 30,
                          weight: 100,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.shares,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
