import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UserDisplay extends StatefulWidget {
  const UserDisplay({super.key});

  @override
  State<UserDisplay> createState() => _UserDisplayState();
}

class _UserDisplayState extends State<UserDisplay> {
  // creating an instance of User class
  String imageUri = "https://randomuser.me/api/portraits/men/61.jpg";
  String title = "Hi, My name is";
  String mainText = "John Doe";

  String name = "John Doe";
  String email = "john@doe.com";
  String mobile = "07878787878";
  String dob = "08/01/1998";

  // 1 = name; 2 = email; 3 = mobile; 4 = dob
  int activeIcon = 1;
  void switchTab(int val) {
    switch (val) {
      case 1:
        title = "Hi, My name is";
        mainText = name;
        activeIcon = 1;
        break;
      case 2:
        title = "My email address is";
        mainText = email;
        activeIcon = 2;
        break;
      case 3:
        title = "My phone number is";
        mainText = mobile;
        activeIcon = 3;
        break;
      case 4:
        title = "My date of birth is";
        mainText = dob;
        activeIcon = 4;
        break;
      default:
        title = "Hi, My name is";
        mainText = name;
        activeIcon = 1;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Building widget with name: $name");
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(imageUri),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: mainText,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    switchTab(1);
                  });
                },
                color: (activeIcon == 1) ? Colors.teal : Colors.grey,
                icon: const Icon(
                  Icons.person,
                  size: 40.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    switchTab(2);
                  });
                },
                color: (activeIcon == 2) ? Colors.teal : Colors.grey,
                icon: const Icon(
                  Icons.email,
                  size: 40.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    switchTab(3);
                  });
                },
                color: (activeIcon == 3) ? Colors.teal : Colors.grey,
                icon: const Icon(
                  Icons.call,
                  size: 40.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    switchTab(4);
                  });
                },
                color: (activeIcon == 4) ? Colors.teal : Colors.grey,
                icon: const Icon(
                  Icons.calendar_month,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  var url = Uri.https('randomuser.me', '/api');
                  var response = await http.get(url);

                  if (response.statusCode == 200) {
                    var jsonResponse = convert.jsonDecode(response.body)
                        as Map<String, dynamic>;

                    setState(() {
                      name = jsonResponse["results"][0]["name"]["first"] +
                          " " +
                          jsonResponse["results"][0]["name"]["last"];
                      email = jsonResponse["results"][0]["email"];
                      dob = jsonResponse["results"][0]["dob"]["date"];
                      mobile = jsonResponse["results"][0]["phone"];
                      imageUri =
                          jsonResponse["results"][0]["picture"]["medium"];

                      switchTab(1);
                    });
                  } else {
                    print(
                        'Request failed with status: ${response.statusCode}.');
                  }
                } catch (e) {
                  print('Error fetching user data: $e');
                }
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.teal),
              ),
              child: const Text(
                "Generate",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
