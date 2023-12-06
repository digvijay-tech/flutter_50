import "package:flutter/material.dart";

// custom images class
class ImageData {
  String src;
  String author;

  ImageData(this.src, this.author);
}

class PictureCards extends StatefulWidget {
  const PictureCards({super.key});

  @override
  State<PictureCards> createState() => _PictureCardsState();
}

class _PictureCardsState extends State<PictureCards> {
  // list of images and author
  List<ImageData> images = [
    ImageData(
      "https://images.pexels.com/photos/19402267/pexels-photo-19402267/free-photo-of-a-man-sitting-on-a-bench-outside-a-store.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "John Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "Jane Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/1193743/pexels-photo-1193743.jpeg?auto=compress&cs=tinysrgb&w=800",
      "James Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/1209843/pexels-photo-1209843.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "Jack Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/886521/pexels-photo-886521.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "Jimmy Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/889839/pexels-photo-889839.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "John Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/159862/art-school-of-athens-raphael-italian-painter-fresco-159862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "Jose Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/1109354/pexels-photo-1109354.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "Jackson Doe",
    ),
    ImageData(
      "https://images.pexels.com/photos/1194420/pexels-photo-1194420.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "Jass Doe",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var img in images)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  img.src,
                ),
              ),
              color: const Color(0xFFdfe6e9),
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: double.infinity,
            height: 200.0,
            margin: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 12.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 12.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0),
                      bottom: Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pic by: ${img.author}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              print("Add Picture..");
                            },
                            color: Colors.white,
                            icon: const Icon(Icons.add_a_photo),
                          ),
                          IconButton(
                            onPressed: () {
                              print("Share Picture..");
                            },
                            color: Colors.white,
                            icon: const Icon(Icons.share),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
