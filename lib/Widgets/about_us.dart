import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Widgets/SideBar.dart';

class AboutUs extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: SideBar(),
        body: Center(
          child: Text('Welcome to Tal\'atna'),
        ),
      ),
    );
  }
}
