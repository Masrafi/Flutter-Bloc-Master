import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

late final GoogleSignInAccount? googleUser;
late GoogleSignIn googleSignIn;

class AuthService {
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //signin check for navigation
  handleSignIn(bool isAuth) {
    if (googleUser != null) {
      return true;
    } else {
      return false;
    }
  }

  //Sign out
  signOut() async {
    FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
  }
}
