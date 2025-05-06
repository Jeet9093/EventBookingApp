import 'package:event_book_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/bottomnav.dart';


class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser()async{
    return await auth.currentUser;
  }
  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    
    final GoogleSignInAccount? googleSignInAccount=
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount?.authentication;
    
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken);
    
    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (result != null){
      Map<String, dynamic> userdata = {
        "Name": userDetails!.displayName,
        "Email": userDetails.email,
        "Image": userDetails.photoURL,
        "Id": userDetails.uid,
      };
      await DatabaseMethods()
        .addUserDetail(userdata, userDetails.uid)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Registered Successfully!!!",
              style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),
            )),
      );
          Navigator.pushReplacement(
               context,
              MaterialPageRoute(builder: (context) => BottomNav()));

      });

    }
  }
}