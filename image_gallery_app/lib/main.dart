import "package:flutter/material.dart";

// importing widgets
import "package:image_gallery_app/widgets/MyAppBar.dart";
import "package:image_gallery_app/widgets/PictureCards.dart";

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFb2bec3),
        appBar: MyAppBar(),
        body: SafeArea(
          child: PictureCards(),
        ),
      ),
    ),
  );
}
