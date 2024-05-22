

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo{
  final _auth=FirebaseAuth.instance;


  Future<User?>Signinwithgoogle()async{
    try{
      ///googlesiginpackge
     final googleuser= await  GoogleSignIn().signIn();
     if(googleuser==null)return null;
     final googleauth = await googleuser.authentication;
     final credential=GoogleAuthProvider.credential(
      accessToken: googleauth.accessToken,
      idToken: googleauth.idToken);
      //firebase
 final userCredential =await _auth.signInWithCredential(credential);
 return userCredential.user;
    }catch(e){
      print(e);
      return null;
    }
  }
}