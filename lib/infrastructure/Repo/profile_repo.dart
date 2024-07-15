
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jobmingle/domin/models/user_model.dart';


class UserProfileRepo {
  // ignore: unused_field
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Usermodel?> getUser() async {
  User? user = FirebaseAuth.instance.currentUser;

  // Check if the user is not null before proceeding
  if (user == null) {
    print("No current user signed in");
    return null;
  }

  try {
    final data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user.uid)
        .get();
    
    print(data);

    if (data.docs.isNotEmpty) {
      return Usermodel.fromJson(data.docs.first.data());
    } else {
      print("No user found");
      return null;
    }
  } catch (e) {
    print("Error fetching user: ${e.toString()}");
    return null;
  }
}

  //-----pdfuploadtheuser---------//

  Future<String?> uploadPdf(File file,String fileName) async {
    try {
       final refernce= FirebaseStorage.instance.ref().child("pdfs");
       final uploadTask=refernce.putFile(file);
       await uploadTask.whenComplete((){});
       final downloadLink=await refernce.getDownloadURL();
       print(downloadLink);
       return downloadLink;
    } catch (e) {
      print('Error uploading PDF: $e');
      throw Exception('Error uploading PDF: $e');
    }
  }

  Future<void> updateUserPdf(String uid, String pdfUrl) async {
    try {
      await _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({'resume': pdfUrl});
    } catch (e) {
      throw Exception('Error updating user with PDF URL: $e');
    }
  }

  Future<void> updateIntroducation(String username, 
      String profilrheadlines, ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': username,
        
        'profileheadlines': profilrheadlines,
        
      });

      print("Name Update Sucessfully");
    } catch (e) {
      print('Error updating name: $e');
    }
  }

  Future<void> educationadd(
      String ?higereducation,
      String ?universitynamecollegename,
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
          .set({
        'higereducation': higereducation,
        'universitynamecollegename': universitynamecollegename,
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

  Future<void>aboutme( String profilesummery)async{
    try{
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
     'profilesummery':profilesummery
    });
    }catch(e){
     print('Error updating education: $e');
    }

  }
  Future<void>personalInfo(String dob,String language,String gender,String email,String phone)async{
try{
  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
    'dob':dob,
    'language':language,
    'gender':gender,
    'email':email,
    'phone':phone
  });
}catch(e){
print('Error updating education: $e');
}
  }
  
  
   
}
