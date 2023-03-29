import 'package:firebase_auth/firebase_auth.dart';

import './Authentication_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: signIn as dynamic,
            child: Text("Sign in"),
          ),
          TextButton(
            onPressed: signUp as dynamic,
            child: Text("Sign Up"),
          )
        ],
      ),
    );
  }

  Future signIn({String? email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e;
    }
  }

  Future signUp({String? email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e;
    }
  }
}