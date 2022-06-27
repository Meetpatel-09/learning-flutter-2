import 'package:demo_fluuter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: 1000,
        width: 1000,
        color: Colors.amber,
        child: Image.asset(
          "assets/images/img.jpg",
          alignment: Alignment.center,
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

