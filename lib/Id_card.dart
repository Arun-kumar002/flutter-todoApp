import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: const Card(),
  ));
}

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  int counter = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          "ID Card",
          style: TextStyle(
            color: Color.fromARGB(255, 232, 210, 208),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/thumb.jpg"),
              radius: 50,
            ),
          ),
          Divider(
            height: 90.0,
            color: Colors.grey[800],
          ),
          const Text(
            "Name",
            style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "CAPTAIN-ARUN",
            style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "CURRENT LEVEL",
            style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$counter',
            style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.email,
                color: Colors.grey[400],
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                "Captain@gmail.com",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 19.0,
                    letterSpacing: 2.0),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }
}
