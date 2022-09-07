import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gym/registration_screen.dart';
import 'package:gym/rounded_button.dart';
import 'login_screen.dart';


class WelcomeScreen extends StatefulWidget {
  static String id='w';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState(){
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation=ColorTween(begin: Colors.blueGrey,end:Colors.white).animate(controller);
    controller.forward();
    controller.addStatusListener((status) {
      if(status==AnimationStatus.completed)
        controller.reverse(from: 1);
    });
    controller.addListener(() {    setState((){});});
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shiv The Fitness Club'),),
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/logo.png'),
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 45.0,
                        fontFamily: 'Agne',
                        color: Colors.grey
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Shiv - The Fitness Club',
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      isRepeatingAnimation:false,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Login',color: Colors.purple[800]!,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},),
            RoundedButton(title: 'Register',color: Colors.purple[800]!,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));},)
          ],
        ),
      ),
    );
  }
}


