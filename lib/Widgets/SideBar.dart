import 'package:flutter/material.dart';
import 'package:talatna1/Widgets/about_us.dart';
import 'package:talatna1/Widgets/account.dart';
import 'package:talatna1/Widgets/friends.dart';
import 'package:talatna1/Widgets/groups.dart';
import 'package:talatna1/main.dart';
import './home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Bills.dart';

class SideBar extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("Hello it is me"),
          accountEmail: Text(user!.email!),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNw-Xb72bT1CdUmNoV1ywDbQTQ22IcUTjOw&usqp=CAU",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1483232539664-d89822fb5d3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG8lMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                ),
                fit: BoxFit.cover),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Account"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Account()));
          },
        ),
        ListTile(
          leading: Icon(Icons.event_note),
          title: Text("Tal'at"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text("Friends"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Friends()));
          },
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text("Groups"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Groups()));
          },
        ),
        ListTile(
          leading: Icon(Icons.receipt_long),
          title: Text("Bills"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bills()));
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Requests"),
          onTap: () {},
          trailing: ClipOval(
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  "8",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              width: 20,
              height: 20,
            ),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("About Us"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutUs()));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Sign Out"),
          onTap: () {
            // FirebaseAuth.instance.signOut();
          },
        ),
      ],
    ));
  }
}
