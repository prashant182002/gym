import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym/welcome_screen.dart';
import 'main_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyHomePage(),));
}

class MyHomePage extends StatefulWidget {
  @override
  Splash createState() => Splash();
}
class Splash extends State<MyHomePage>  {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageInp(),
    );
  }
}

class ImageInp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage("assets/logo.png"),
        ),
      )
    );
  }
}
