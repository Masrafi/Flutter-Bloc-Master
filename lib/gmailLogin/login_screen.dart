import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_service.dart';
import 'gmail_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Google Login"),
          backgroundColor: Colors.green,
        ),
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              } else {
                return _body();
              }
            }));
  }

  Widget _body() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: size.height * 0.2,
          bottom: size.height * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Hello, \nGoogle sign in", style: TextStyle(fontSize: 30)),
          GestureDetector(
              onTap: () {
                AuthService().signInWithGoogle();
              },
              child: const Image(
                  width: 100, image: AssetImage('assets/google.jpg'))),
        ],
      ),
    );
  }
}
