import 'package:firebase_auth/firebase_auth.dart';
import 'package:b_finder/models/authUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
AuthUser _userFromFirebaseUser(User user){
  return user != null ? AuthUser(uid: user.uid): null;
}

Stream<AuthUser> get user{
  return _auth.authStateChanges()
  .map((User user) => _userFromFirebaseUser(user));
}

  //anon sign in
  Future signInAnon() async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
    Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }

  }
  
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}