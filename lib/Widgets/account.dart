import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Widgets/SideBar.dart';

import '../Objects/friends_object.dart';
import '../Objects/tal\'aa.dart';

class Account extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final List<Friend> _dataList;
  final List<Talaa> a;
  Account(this._dataList, this.a);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: SideBar(_dataList, a),
        body: Center(
          child: Text('Welcome to Tal\'atna'),
        ),
      ),
    );
  }
}
