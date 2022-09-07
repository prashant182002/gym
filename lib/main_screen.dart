import 'package:flutter/material.dart';
import 'package:gym/measurment.dart';
import 'main.dart';
import 'package:gym/registration_screen.dart';
import 'card.dart';
int _index=0;
class MainScreen extends StatefulWidget {
  static String id='m';
  @override
  MainScreenState createState() => MainScreenState();
}
class MainScreenState extends State<MainScreen>{
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  // Function child;
  Widget build(BuildContext context){
    Widget child=MainScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shiv The fitness Club"),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _index!=0,
            child: TickerMode(enabled: _index==0, child: MaterialApp(home: MeasScreen(),)),
          ),
          Offstage(
            offstage: _index!=1,
            child:TickerMode(enabled: _index==1, child:  MaterialApp(home: RegistrationScreen(),)),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
