import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Widgets/SideBar.dart';

import '../Objects/friends_object.dart';
import '../Objects/tal\'aa.dart';

class Groups extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final List<Friend> _dataList;
  final List<Talaa> a;
  Groups(this._dataList, this.a);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Groups"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: SideBar(_dataList, a),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
          ),
          child: Center(
            child: Text('Welcome to Tal\'atna'),
          ),
        ),
      ),
    );
  }
}
