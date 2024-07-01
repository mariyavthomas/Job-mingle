import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadResumeRepo{
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<String?>uploadresuem(File file,String filename)async{
    try{
      final refernce= FirebaseStorage.instance.ref().child("pdfs");
       final uploadTask=refernce.putFile(file);
       await uploadTask.whenComplete((){});
       final downloadLink=await refernce.getDownloadURL();
       print(downloadLink);
       return downloadLink;
    }
    catch(e){
         print('Error uploading PDF: $e');
      throw Exception('Error uploading PDF: $e');
    }
   }

}