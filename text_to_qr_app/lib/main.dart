import "package:flutter/material.dart";
import "package:qr_flutter/qr_flutter.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Text To QR",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: const SafeArea(
          child: QRContainer(),
        ),
      ),
    ),
  );
}

class QRContainer extends StatefulWidget {
  const QRContainer({super.key});

  @override
  State<QRContainer> createState() => _QRContainerState();
}

class _QRContainerState extends State<QRContainer> {
  // text editing controller
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.all(40.0),
            // taking screen height from device using MediaQuery
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: (_textEditingController.text == "")
                  ? const Text("No Data Provided!")
                  : QrImageView(
                      data: _textEditingController.text,
                    ),
            ),
          ),
          SizedBox(
            // taking screen height from device using MediaQuery
            height: MediaQuery.of(context).size.height / 6,
            child: Center(
              child: TextField(
                controller: _textEditingController,
                maxLength: 60,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            // taking screen height from device using MediaQuery
            height: MediaQuery.of(context).size.height / 18,
            child: TextButton(
              onPressed: () {
                print(_textEditingController.text);
                setState(() {});
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              child: const Text(
                "Generate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
