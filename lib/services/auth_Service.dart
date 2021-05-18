import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/Models/UserModel.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

UserId? _userFromFirebase(User user) {
  // ignore: unnecessary_null_comparison
  return user != null ? UserId(uId: user.uid) : null;
}

Future signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? firebaseUser = result.user;
    return _userFromFirebase(firebaseUser!);
  } catch (e) {
    print(e);
  }
}

Future signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? firebaseUser = result.user;
    return _userFromFirebase(firebaseUser!);
  } catch (e) {
    print(e);
  }
}

Future resetPass(String email) async {
  try {
    return _auth.sendPasswordResetEmail(email: email);
  } catch (e) {
    print(e);
  }
}

Future signOut() async {
  try {
    return _auth.signOut();
  } catch (e) {
    print(e);
  }
}
