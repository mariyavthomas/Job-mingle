import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/pdf/pdfdownload_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';

import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/profile_widgets/education.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/profile_widgets/peronal_info.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/profile_widgets/profile_pic.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/profile_widgets/profile_summery.dart';

// ignore: must_be_immutable
class Profile_Listview extends StatefulWidget {
  Profile_Listview({super.key, required this.useruid, required this.user});

  final String? useruid;
  Usermodel? user;

  @override
  State<Profile_Listview> createState() => _Profile_ListviewState();
}

class _Profile_ListviewState extends State<Profile_Listview> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        if (widget.user != null) Profile_Image(user: widget.user),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 238, 244, 250)),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(widget.user?.profileheadlines ?? 'No profile headline'),
                      ),
                    ),
                  ),
                  if (widget.user != null) Personal_Info(user: widget.user!),
                  SizedBox(
                    height: 10,
                  ),
                  // Uncomment and update if you have Education widget implementation
                  // if (widget.user != null) Education(user: widget.user),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Container(
                      width: 370,
                      height: 150,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Resume",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 200),
                                BlocBuilder<ProfileBloc, ProfileState>(
                                  builder: (context, state) {
                                    if (state is Pdfuploadsuccess) {
                                      return Row(
                                        children: [
                                          Text(
                                            state.downloadUrl.split('/').last,
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                          Icon(Icons.description, color: Colors.blue),
                                        ],
                                      );
                                    } else {
                                      return Text(
                                        "Update",
                                        style: TextStyle(color: Colors.blue),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<PdfdownloadBloc, PdfdownloadState>(
                            builder: (context, state) {
                              print(state);
                              if(state is Uloadloading){
                                return Center(child: CircularProgressIndicator());
                              }
                            else  if (state is Resumeuploadsuccess) {
                                return Column(
                                  children: [
                                    Icon(
                                      Icons.folder,
                                      color: Color.fromARGB(255, 234, 214, 32),
                                      size: 40,
                                    ),
                                    Text('Resume Uploaded')
                                  ],
                                );
                              } else {
                                return Center(
                                  child: IconButton(
                                    onPressed: () {
                                      pickupanduploadcv(context, widget.useruid!);
                                    },
                                    icon: Icon(
                                      Icons.upload,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (widget.user != null)
                    Profile_summery(
                      user: widget.user!,
                    )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> pickupanduploadcv(BuildContext context, String uid) async {
    try {
      final pickedFile = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (pickedFile != null) {
        String filename = pickedFile.files[0].name;

        File file = File(pickedFile.files.first.path!);
        // ignore: unused_local_variable
        DateTime uploadDate = DateTime.now();
        context.read<PdfdownloadBloc>().add(UploadResume(
            file: file,
            filename: filename,
            uid: FirebaseAuth.instance.currentUser!.uid));
        print(file);
      } else {
        print("Null File is Picked here");
      }
    } catch (e) {
      print("Error picking and uploading PDF: $e");
    }
  }
}
