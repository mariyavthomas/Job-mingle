import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadResumeRepo {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> uploadResume(File file, String filename) async {
    try {
      final ref = _storage.ref().child('resumes/${DateTime.now().microsecondsSinceEpoch}_$filename');

      // Set metadata for the file
      final metadata = SettableMetadata(
        contentType: 'application/pdf', // Setting MIME type for PDF files
      );

      final uploadTask = ref.putFile(file, metadata);

      // Optionally, listen to upload progress
      uploadTask.snapshotEvents.listen((event) {
        print('Upload progress: ${(event.bytesTransferred / event.totalBytes) * 100}%');
      }, onError: (error) {
        print('Upload error: $error');
      });

      await uploadTask;

      final downloadLink = await ref.getDownloadURL();
      print('Download URL: $downloadLink');

      await _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        'resume': filename,
        'downloadUrl': downloadLink,
        'uploadDate resume': DateTime.now(),
      });

      return downloadLink;
    } catch (e) {
      print('Error uploading PDF: $e');
      throw Exception('Error uploading PDF: $e');
    }
  }
}
