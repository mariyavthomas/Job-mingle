import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobmingle/presentaion/screen/user/home/screen/home_screen_view.dart';

class AuthRepoGoogleComapany {
  final _auth = FirebaseAuth.instance;

  
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
        await   FirebaseFirestore.instance.collection('company').doc(user.uid).set({
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


void showBottomAlertBox(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Text(
              'Continue with Google',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'You will be redirected to Google for a secure and faster login.Your name and email will be shared with jomingle app and websit',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox(
                  width: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Color.fromARGB(200, 75, 110, 225)),
                  ),
                ),
                SizedBox(width: 100),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll( Color.fromARGB(200, 75, 110, 225))),
                  onPressed: () {
                  
                     AuthRepoGoogleComapany().signInWithGoogle(context,true);
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
}
