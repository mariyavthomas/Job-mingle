import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class A{
Future<String>upload_picture(String file,String userid)async{
  try{
  File imagefile=File(file);
  Reference firebaseref=FirebaseStorage.instance.ref().child('$userid/PP/${userid}_lead');
  await firebaseref.putFile(imagefile);
  String url= await firebaseref.getDownloadURL();
  await FirebaseFirestore.instance.collection('users').doc(userid).update({'pic: url'} as Map<Object, Object?>);
  return url;
  }catch(e){
  print(e.toString());
   rethrow;
  }
}
}