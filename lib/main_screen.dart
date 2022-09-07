import 'package:flutter/material.dart';
import 'package:gym/measurment.dart';
import 'package:gym/welcome_screen.dart';
import 'alarm.dart';
import 'contact.dart';
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
    switch (_index) {
      case 0:
        child = WelcomeScreen();
        break;
      case 1:
        child = Alarm();
        break;
    }
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
            child:TickerMode(enabled: _index==1, child:  MaterialApp(home: Alarm(),)),
          ),
          Offstage(
            offstage: _index!=2,
            child:TickerMode(enabled: _index==2, child:  MaterialApp(home: Contact(),)),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.purple,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm, color: Colors.blue,),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail, color: Colors.orange,),
            label: 'Contact Us',
          ),
        ],
      ),
    );
  }
}
