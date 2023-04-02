import 'package:firebase_auth/firebase_auth.dart';

import './Widgets/home_page.dart';
import './Widgets/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Objects/friends_object.dart';
import 'Objects/tal\'aa.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Talaa> a = [
    Talaa(
        "1989-07-28",
        [
          Friend("Khaled", "example@gmail.com", "SA828282983", false),
          Friend("Naser", "e@gmail.com", "SA68000028288", false)
        ],
        "Riyadh",
        "kashta"),
    Talaa(
        "2023-04-15",
        [
          Friend("Mohammed", "le@gmail.com", "SA8288484883", false),
          Friend("Ahmed", "ahmed@gmail.com", "SA680000243568", false)
        ],
        "Dammam",
        "cafe")
  ];
  final List<Friend> b = [
    Friend("Khaled", "example@gmail.com", "SA828282983", false),
    Friend("Naser", "e@gmail.com", "SA68000028288", false),
    Friend("Mohammed", "le@gmail.com", "SA8288484883", false),
    Friend("Ahmed", "ahmed@gmail.com", "SA680000243568", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: "Tal'atna",
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage(b, a);
              } else {
                return SignInPage();
              }
            }),
      ),
    );
  }
}
