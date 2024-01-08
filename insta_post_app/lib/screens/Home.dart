import "package:flutter/material.dart";
import "package:insta_post_app/widgets/post.dart";
import "package:insta_post_app/widgets/stories.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Instagram"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.heart_broken),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble),
          ),
        ],
      ),
      body: const Column(
        children: [
          Stories(),
          Expanded(
            child: Post(),
          ),
        ],
      ),
    );
  }
}
