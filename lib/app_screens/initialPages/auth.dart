import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(String email, String password) async{
    // AuthResult result = await _firebaseAuth
    //         .signInWithEmailAndPassword(email: email, password: password);
    //          FirebaseUser user = result.user;
    //          return user.uid;

     final user = await _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password);
             //FirebaseUser user = result.user;
             return user.user?.uid;


  }

  Future<String> createUserWithEmailAndPassword(String email, String password)async{
    final user = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
 //FirebaseUser user = result.user;
 return user.user?.uid;
  }

  Future<String> currentUser() async{
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  Future<void> signOut()async{
    return _firebaseAuth.signOut();
  }

}

Future<bool> lWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if(account == null )
        return false;
      AuthResult res = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if(res.user == null)
        return false;
      return true;
    } catch (e) {
      print(e.message);
      print("Error logging with google");
      return false;
    }
  }



// class AuthService{
    
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//    //sign in anyno
//    Future signInAnon() async{
//      try{
//        AuthResult result=await _auth.signInAnonymously(); 
//        FirebaseUser user=result.user;
//        return user;
      
//      }catch(e){
//         print(e.toString());
//         return null;
//      }
//    }
//     //sign in email and password
//     //register with email and password
//     //sign out
// }
