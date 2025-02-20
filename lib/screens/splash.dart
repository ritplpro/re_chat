import 'dart:async';

import 'package:flutter/material.dart';
import 'package:re_chat/firebase/firebase.dart';
import 'package:re_chat/screens/home_page.dart';
import 'package:re_chat/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkSesion();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Re_chat",style: TextStyle(fontSize: 30),)),
    );
  }


  checkSesion(){
    return Timer(Duration(seconds: 3),() async {
      var prefs=await SharedPreferences.getInstance();
      String? valuess=prefs.getString(Firebaseintialize.Prefs_Set_UID);

      if(valuess != null && valuess !=""){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
      }else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()));
      }
    });
  }


}
