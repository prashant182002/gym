import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'constants.dart';
import 'main_screen.dart';
class RegistrationScreen extends StatefulWidget {
  static String id='r';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner=false;
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email=value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: kDecor.copyWith(hintText: 'Enter your email',),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password=value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: kDecor.copyWith(hintText: 'Enter your password',),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(title: 'Register',color: Colors.blueAccent,onPress: ()async{
                  print(email);
                  setState((){
                    showSpinner=true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser.user!=null){
                      setState((){
                        showSpinner=false;
                      });
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen()));
                    }
                  }
                  catch(e){
                    print(e);
                  }
                },)
              ],
            ),
          )
      ),
    );
  }
}
