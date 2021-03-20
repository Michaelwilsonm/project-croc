import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (error) {
      var errorMessage = signInError(error);
      return Future.error(errorMessage);
    }
  }

  // when creating a new user, we should be storing a new user document with profile settings etc.
  // database service can do that

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  signInError(FirebaseAuthException error) {
    print(error.code);
    switch (error.code) {
      case "invalid-email":
        return "Invalid email address format";
        break;
      default:
        return "Invalid Email or Password";
    }
  }
}
