import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'gmail_home.dart';
import 'login_screen.dart';

late final GoogleSignInAccount? googleUser;

class AuthService {
  //Determine if the user is authenticated.
  handleAuthState() {
    print("This is Auth andle state");
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginPage();
          }
        });
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print(
        "Thi si smasrafi ................................................................");
    print(FirebaseAuth.instance.currentUser);

    return HomePage();
    //return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //signin check for navigation
  handleSignIn(bool isAuth) {
    print("............................11111111111........................");
    if (googleUser != null) {
      return true;
    } else {
      return false;
    }
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
