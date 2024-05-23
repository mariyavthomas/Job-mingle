import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobmingle/presentaion/screen/home/home_screen_view.dart';

class AuthRepoGoogle {
  final _auth = FirebaseAuth.instance;

  // Future<User?> signInWithGoogle( BuildContext context) async {
  //   User? user;
  //   try {
  //     // Google Sign-in package
  //     final googleUser = await GoogleSignIn().signIn();
  //     if (googleUser != null){
  //     final googleAuth = await googleUser.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     final userCredential = await _auth.signInWithCredential(credential);
  //     user=userCredential.user;
    
  //       }
  //         // Firebase
      
     
  //   } catch (e) {
  //     print(e);
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Error'),
  //           content: Text(e.toString()),
  //           actions: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
    
  //   }
  //   return user;
  // }
  Future<void> signInWithGoogle(BuildContext context, bool isUser) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      print(user);

      if (user != null && isUser) {
        await   FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "Name": user.displayName,
          "Email": user.email,
          "profile": user.photoURL,
        });

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false,
        );
      }
    }
  } 
  catch(e)
{
  print(e.toString());
}}
}
