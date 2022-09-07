import 'package:flutter/material.dart';
import 'card.dart';
class MeasScreen extends StatefulWidget {
  @override
  MeasScreenState createState() => MeasScreenState();
}
class MeasScreenState extends State<MeasScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          ReCard(textshow: 'Weight', imageshow: "assets/weight.jpg"),
          ReCard(textshow: 'Chest', imageshow: "assets/pecks.png"),
          ReCard(textshow: 'Back', imageshow: "assets/back.jpg"),
          // ReCard(textshow: 'Thighs', imageshow: "assets/thigh.png"),
          ReCard(textshow: 'Calfs', imageshow: "assets/calf.jpg"),
          ReCard(textshow: 'Trisep', imageshow: "assets/tricep.jpg"),
          ReCard(textshow: 'Shoulder', imageshow: "assets/sholder.jpg"),
          ReCard(textshow: 'Bisep', imageshow: "assets/bisep.png"),
        ],
      ),
    );
  }
}