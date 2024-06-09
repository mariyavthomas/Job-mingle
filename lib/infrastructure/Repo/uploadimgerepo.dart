import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as _firebaseStorage;
import 'package:image_picker/image_picker.dart';

class ImageRepo {
  final picker = ImagePicker();
  Future<XFile?> getimagefromcamera() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }

  Future<XFile?> getimagefrimgallary() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
  //  final imagecropper= await picker.
    return file;
  }

  Future<List<XFile>?> getMultiImage() async {
    List<XFile> file = await picker.pickMultiImage();
    return file;
  }

  Future<String?> uploadImageToFirebase(XFile file,String uid) async {
    try {
      final File files = File(file.path);
       _firebaseStorage.Reference ref= _firebaseStorage.FirebaseStorage.instance.ref('${DateTime.now().millisecondsSinceEpoch.toString()}');
_firebaseStorage.UploadTask  uploadTask=ref.putFile(files);
await uploadTask;
String imageUrl=await ref.getDownloadURL();
        FirebaseFirestore.instance.collection('users').doc(uid).update({
            'pic': imageUrl,
           
          });
      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }
 
}
