import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/neweducation.dart';

class UserProfileRepo {
  // ignore: unused_field
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Usermodel?> getuser() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user!.uid)
          .get();
      print(data);
      if (data.docs.isNotEmpty) {
        return Usermodel.fromJson(data.docs.first.data());
      } else {
        print("No user foun");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //-----pdfuploadtheuser---------//

  Future<String?> uploadPdf(PlatformFile file) async {
    try {
      if (file.bytes == null) {
        // Access the file as a stream and read bytes
        File localFile = File(file.path!);
        Uint8List bytes = await localFile.readAsBytes();
        Reference ref = _storage.ref().child('pdfs/${file.name}');
        UploadTask uploadTask = ref.putData(bytes);
        TaskSnapshot snapshot = await uploadTask;
        return await snapshot.ref.getDownloadURL();
      } else {
        // Directly upload using file.bytes if available
        Reference ref = _storage.ref().child('pdfs/${file.name}');
        UploadTask uploadTask = ref.putData(file.bytes!);
        TaskSnapshot snapshot = await uploadTask;
        return await snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      print('Error uploading PDF: $e');
      throw Exception('Error uploading PDF: $e');
    }
  }

  Future<void> updateUserPdf(String uid, String pdfUrl) async {
    try {
      await _firestore.collection('users').doc(uid).update({'resume': pdfUrl});
    } catch (e) {
      throw Exception('Error updating user with PDF URL: $e');
    }
  }

  Future<void> updateIntroducation(String username, String education,
      String profilrheadlines, String experience) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': username,
        'education': education,
        'profileheadlines': profilrheadlines,
        'experence': education
      });

      print("Name Update Sucessfully");
    } catch (e) {
      print('Error updating name: $e');
    }
  }

  Future<void> educationadd(
      String ?higereducation,
      String ?universityname,
      String ?course,
      String ?specialization,
      String ?coursetype,
      String? courseStaringyear,
      String ?courseendingyear,
      String? grade) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'higereducation': higereducation,
        'universityname': universityname,
        'course': course,
        'specialization': specialization,
        'coursetype': coursetype,
        'courseStaringyear': courseStaringyear,
        'courseendingyear': courseendingyear,
        'grade': grade
      });
    } catch (e) {
      print('Error updating education: $e');
    }
  }
}
