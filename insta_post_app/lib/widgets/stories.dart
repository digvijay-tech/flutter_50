import "package:flutter/material.dart";

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final images = <String>[
    "https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1542085/pexels-photo-1542085.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/343717/pexels-photo-343717.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/428361/pexels-photo-428361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1687675/pexels-photo-1687675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color(0x499E9E9E),
      height: 100.0,
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var img in images)
            GestureDetector(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (_, __, ___) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(img),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 70.0,
                width: 80.0,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(img),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
