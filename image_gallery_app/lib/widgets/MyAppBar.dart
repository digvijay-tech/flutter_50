import "package:flutter/material.dart";

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          print("Menu button clicked..");
        },
        iconSize: 32.0,
        color: const Color(0xFFEFEFEF),
        icon: const Icon(Icons.menu),
      ),
      centerTitle: true,
      backgroundColor: Colors.teal,
      title: const Text(
        "Image Gallery",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print("Bookmarks button clicked..");
          },
          iconSize: 28.0,
          color: const Color(0xFFEFEFEF),
          icon: const Icon(Icons.bookmarks),
        ),
        IconButton(
          onPressed: () {
            print("Settings button clicked..");
          },
          iconSize: 28.0,
          color: const Color(0xFFEFEFEF),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
