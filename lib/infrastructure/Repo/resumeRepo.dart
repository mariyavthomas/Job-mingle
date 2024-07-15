import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadResumeRepo{
  // ignore: unused_field
  final FirebaseStorage _storage = FirebaseStorage.instance;
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<String?>uploadresuem(File file,String filename)async{
    try{
      final refernce= FirebaseStorage.instance.ref().child("resume");
       final uploadTask=refernce.putFile(file);
       await uploadTask.whenComplete((){});
       final downloadLink=await refernce.getDownloadURL();
       print(downloadLink);
       await _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        
        'resume': filename,
        'downloadUrl': downloadLink,
        'uploadDate': DateTime.now(),
      });
       return downloadLink;
    }
    catch(e){
         print('Error uploading PDF: $e');
      throw Exception('Error uploading PDF: $e');
    }
   }

}