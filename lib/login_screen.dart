import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym/rounded_button.dart';
import 'main_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'constants.dart';
class LoginScreen extends StatefulWidget {
  static String id='l';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(title: 'Login',color: Colors.blue,onPress: ()async{
                  setState((){
                    showSpinner=true;
                  });
                  try {
                    final check = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if(check!=null){
                      setState((){
                        showSpinner=false;
                      });
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen()));
                    }
                  }
                  catch(e){
                    print(e);
                  }
                }),
              ],
            ),
          )
      ),
    );
  }
}
