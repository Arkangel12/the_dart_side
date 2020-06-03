import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //TODO add firebase auth instance
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  // sign in anon
  Future<bool> signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      print(result.user.uid);
      return result.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // sign in with email and password
  Future<bool> signInUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(result.user.uid);
      return result.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // register with email and password
  Future<bool> createUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(result.user.uid);
      return result.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
