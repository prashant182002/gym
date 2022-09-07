import 'package:flutter/material.dart';
import 'card.dart';
class MainScreen extends StatefulWidget {
  static String id='m';
  @override
  MainScreenState createState() => MainScreenState();
}
class MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shiv The fitness Club"),
      ),
      body: Column(
          children: [
              ReCard(textshow: "Chest",imageshow: "assets/pecks.png"),
          ],
      ),
    );
  }
}
