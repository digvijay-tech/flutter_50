import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

class PostContent {
  int id;
  String image;
  String name;
  String location;
  bool isSaved;
  bool isLiked;

  PostContent(
    this.id,
    this.image,
    this.name,
    this.location,
    this.isSaved,
    this.isLiked,
  );
}

var posts = <PostContent>[
  PostContent(
    0,
    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Harshil Vaghani",
    "Cornwell, UK",
    true, // saved
    true, // liked
  ),
  PostContent(
    1,
    "https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Jemma Doe",
    "London, UK",
    false,
    true,
  ),
  PostContent(
    2,
    "https://images.pexels.com/photos/1542085/pexels-photo-1542085.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Jane Doe",
    "London, UK",
    true,
    false,
  ),
  PostContent(
    3,
    "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "John Doe",
    "London, UK",
    false,
    false,
  ),
];

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var post in posts)
          PostWrapper(
            postId: post.id,
          ),
      ],
    );
  }
}

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostHeader(postId),
        PostImage(postId),
      ],
    );
  }
}

class PostHeader extends StatelessWidget {
  var postId;

  PostHeader(this.postId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              posts[postId].image,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  posts[postId].name,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  posts[postId].location,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ),
      ],
    );
  }
}

class PostImage extends StatelessWidget {
  var postId;

  PostImage(this.postId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(posts[postId].image),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.heart_broken,
                      size: 34.0,
                      color: (posts[postId].isLiked)
                          ? const Color(0xFFee5253)
                          : const Color(0xFF676767),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: ((context) {
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            color: Colors.white,
                            child: Comments(),
                          );
                        }),
                      );
                    },
                    icon: const Icon(
                      Icons.comment,
                      size: 34.0,
                      color: Color(0xFF474747),
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  (posts[postId].isSaved)
                      ? Icons.bookmark
                      : Icons.bookmark_add_outlined,
                  size: 34.0,
                  color: Color(0xFF474747),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              for (int i = 0; i < 100; i++)
                ListTile(
                  title: Text("John Doe"),
                  subtitle: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                  trailing: IconButton(
                    icon: Icon(Icons.reply),
                    onPressed: () {},
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
