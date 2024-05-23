import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthRepo {
  FirebaseAuth authphone = FirebaseAuth.instance;
  User? firebaseUser;
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> loginwithphone(
      {required String phonenumber,
      required Function(PhoneAuthCredential) verficationComplated,
      required Function(FirebaseAuthException) verficationfailed,
      required Function(String, int?) codesent,
      required Function(String) codeAutoRetrivalTimeout}) async {
    await authphone.verifyPhoneNumber(
        verificationCompleted: verficationComplated,
        verificationFailed: verficationfailed,
        codeSent: codesent,
        codeAutoRetrievalTimeout: codeAutoRetrivalTimeout);
  }
}
