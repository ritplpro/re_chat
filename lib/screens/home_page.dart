import 'package:flutter/material.dart';
import 'package:re_chat/firebase/firebase.dart';
import 'package:re_chat/screens/Contacts_page.dart';
import 'package:re_chat/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Re-chat"),
        actions: [
          PopupMenuButton(child: Icon(Icons.more_vert),
              itemBuilder: (contexxt){
            return [
              PopupMenuItem(onTap: () async {
                //logout_session
                var prefs=await SharedPreferences.getInstance();
                prefs.setString(Firebaseintialize.Prefs_Set_UID,"");
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));},
                  child: Text("Logout")),];
          }),



        ],
      ),
      body: Column(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactsPage()));
      },child: Icon(Icons.add),),
    );
  }
}
