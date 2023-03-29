import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Widgets/SideBar.dart';

class Groups extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Groups"),
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
