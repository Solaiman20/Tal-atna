import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './SideBar.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tal'atna"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: SideBar(),
      body: Center(
        child: Text('Welcome to Tal\'atna'),
      ),
    );
  }
}
