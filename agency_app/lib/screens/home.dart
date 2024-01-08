import 'package:flutter/material.dart';

class MyAgency extends StatelessWidget {
  const MyAgency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/settings");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Hero Agency",
          style: TextStyle(
            fontSize: 22.0,
            color: Color(0xFF505050),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/settings");
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi John,",
                      style: TextStyle(
                        fontSize: 26.0,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Where would you like to go next!",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/19526024/pexels-photo-19526024/free-photo-of-cheerful-decoration-on-residential-building.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
