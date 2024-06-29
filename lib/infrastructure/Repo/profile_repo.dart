
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/user_model.dart';



class UserProfileRepo {
  Future<Usermodel?> getuser() async {
    User? user = FirebaseAuth.instance.currentUser;
   
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user!.uid)
          .get();
          print(data);
          if(data.docs.isNotEmpty){
            return Usermodel.fromJson(data.docs.first.data());
          }
          else{
            print("No user foun");
            return null;
          }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //-----pdfuploadtheuser---------//

  Future<String?>uploadpdf()async{
   
  }

  // Future<void>updateUser(Usermodel usermodel,BuildContext context)async{
  //   try{
  //     print("hai");
  //      // ignore: unused_local_variable
  //      File file=File(usermodel.pic);
  //      if(file.existsSync()){
  //       firebase_storage.Reference ref=firebase_storage.FirebaseStorage.instance.ref('${DateTime.now().microsecondsSinceEpoch.toString()}');
  //       firebase_storage.UploadTask uploadTask =ref.putFile(file);
  //       await uploadTask;
  //      String downloadURL= await ref.getDownloadURL();
  //       usermodel.pic=downloadURL;
  //      }else{
  //       print("file dose not exist at path :${usermodel.pic}");
  //      }
  //      await FirebaseFirestore.instance.collection('users').doc(usermodel.uid).update(usermodel.toJson());
  //      print(usermodel.toJson());
  //      Navigator.pop(context);

  //   }
  //   catch(e){
  //          print('Error updating agency: $e');
  //     throw e;
  //   }
  // }
}
