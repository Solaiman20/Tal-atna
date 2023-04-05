import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Widgets/SideBar.dart';
import 'package:talatna1/Widgets/new_friend.dart';
import '../Objects/bills.dart';
import '../Objects/friends_object.dart';
import '../Objects/groups_object.dart';
import '../Objects/tal\'aa.dart';

class Friends extends StatefulWidget {
  final List<Friend> _dataList;
  final List<Talaa> a;
  final List<Group> b;
  final List<Bill> c;
  Friends(this._dataList, this.a, this.b, this.c);
  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final user = FirebaseAuth.instance.currentUser;
  Friend? selectedFriend;
  final titleController = TextEditingController();
  final emailController = TextEditingController();
  final ibanController = TextEditingController();

  void addFriend(String title, String email, String iban) {
    final newtx = Friend(
      titleController.text,
      emailController.text,
      ibanController.text,
      false,
    );
    setState(() {
      widget._dataList.add(newtx);
    });
  }

  void _startAddNewFriend(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () => _startAddNewFriend(ctx),
          child: NewFriend(
              addFriend, titleController, emailController, ibanController),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Friends"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: SideBar(widget._dataList, widget.a, widget.b,widget.c),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget._dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                selectedFriend = widget._dataList[index];
                              });
                            },
                            leading: const Icon(Icons.list),
                            trailing: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    widget._dataList.removeAt(index);
                                  });
                                }),
                            title: Text(
                              widget._dataList[index].userName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 5,
                  child: Builder(
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Username: ",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text(selectedFriend?.userName ?? "",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Email: ",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text(selectedFriend?.email ?? "",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("IBAN: ",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text(selectedFriend?.iban ?? "",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewFriend(context),
        ),
      ),
    );
  }
}
