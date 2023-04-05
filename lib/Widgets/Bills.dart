import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Widgets/SideBar.dart';

import '../Objects/friends_object.dart';
import '../Objects/groups_object.dart';
import '../Objects/tal\'aa.dart';

class Bills extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final List<Friend> _dataList;
  final List<Talaa> a;
  final List<Group> b;
  Bills(this._dataList, this.a, this.b);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bills"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: SideBar(_dataList, a, b),
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
