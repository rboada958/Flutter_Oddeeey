import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_social/ui/login/models/login/request_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class Auth {
  static Future<RequestLogin> signInGoogle() async {
    RequestLogin requestLogin;

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    List<String> displayName = user.displayName.split(" ");
    String name = displayName[0];
    String lastName = displayName[1];

    requestLogin = RequestLogin(
        idSocial: user.hashCode,
        name: name,
        lastName: lastName,
        socialFoto: user.photoUrl,
        email: user.email);

    return requestLogin;
  }

  static void signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
