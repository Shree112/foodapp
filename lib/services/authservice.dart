import 'package:maps/screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:maps/screens/LoginScreen.dart';

class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        });
  }

  //Sign out
 Future signOut() async {
   await FirebaseAuth.instance.signOut();
  }

  //Save to device
  Future<void> savePhoneNumber(String phno) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('Phone Number', phno);
    
  }

}