import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/pdf/pdfdownload_bloc.dart';

class Pdfwidget extends StatelessWidget {
  const Pdfwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfdownloadBloc, PdfdownloadState>(
        builder: (context, state) {
      if (state is Resumeuploadsuccess) {
        return TextButton(
            onPressed: () {
              //  String pdfUrl = "https://firebasestorage.googleapis.com/v0/b/jobmingle-91729.appspot.com/o/path/to/your/pdfFile.pdf?alt=media&token=10ab7dcd-6e82-4c0f-b2bb-8ad9654b6f25";
              // _openPdf(context, state.downloadUrl);
              print(state.downloadUrl);
            },
            child: Text("Resume.pdf"));
      }

      return Center();
    });
  }
  Future<void> _pickupanduploadcv(BuildContext context, String uid) async {
    try {
      final pickedFile = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (pickedFile != null) {
        String filename = pickedFile.files[0].name;

        File file = File(pickedFile.files.first.path!);
        DateTime uploadDate = DateTime.now();
        context.read<PdfdownloadBloc>().add(UploadResume(
            file: file,
            filename: filename,
            uid: FirebaseAuth.instance.currentUser!.uid));
        print(file);
      } else {
        print(" Null FIle is Picked here");
      }
    } catch (e) {
      print("Error picking and uploading PDF: $e");
    }
  }
}

