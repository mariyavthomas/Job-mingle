import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:jobmingle/application/Update_pic/update_pic_bloc.dart';

import 'package:jobmingle/application/Update_pic/update_pic_state.dart';
import 'package:jobmingle/application/pdf/pdfdownload_bloc.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/infrastructure/Repo/uploadimgerepo.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/intriduction.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/neweducation.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/picture.dart';
import 'package:jobmingle/utils/customcolor.dart';

import '../../bottamnaviationbar/widgets/drawer.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  ImageRepo imagefire = ImageRepo();
  String? pickedImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoaedState) {
              // ignore: unused_local_variable
              String? useruid = state.user.uid;

              return ListView(children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                          onPressed: () {
                            drawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePicture()));
                      },
                      child: BlocBuilder<UpdatePicBloc, UpdatePicState>(
                        builder: (context, state) {
                          return CircleAvatar(
                            maxRadius: 40,
                            backgroundImage: state.file != null
                                ? FileImage(File(state.file!.path))
                                : null,
                            backgroundColor: Color.fromARGB(255, 176, 176, 176),
                            child: state.file != null
                                ? SizedBox()
                                : Icon(
                                    Icons.person_add,
                                    size: 40,
                                    color: CustomColor.graycolor(),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Introduction(
                                      name: state.user.name!,
                                      profileheadlines:
                                          state.user.profileheadlines,
                                    )));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                              ),
                              Center(
                                child: Text(
                                  state.user.name!.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Icon(
                                Icons.edit,
                                color: CustomColor.bluelight(),
                              )
                            ],
                          ),
                          Text(
                            state.user.universitynamecollegename!,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                                child: Text(state.user.profileheadlines!)),
                          ),
                          Container(
                            height: 150,
                            width: 370,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "Basic details",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 160,
                                    ),
                                    Icon(
                                      Icons.edit_square,
                                      color: CustomColor.bluelight(),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(state.user.email!),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(state.user.phone!),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: 375,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Education",
                                          style: TextStyle(
                                              color: CustomColor.blckcolor(),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Text(
                                      'Higer Education : ${state.user.higereducation!}'),
                                  Text('Course :${state.user.course}'),
                                  Text('Course Type :${state.user.coursetype}'),
                                  Text(
                                      'Stating Year :${state.user.courseStaringyear}'),
                                  Text(
                                      'Ending Year :${state.user.courseendingyear}'),
                                  Text(
                                      'Grade of the Course :${state.user.grade}'),
                                  Text(
                                      'University Name/College Name : ${state.user.universitynamecollegename}')
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 150,
                              width: 370,
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
                                                    state.downloadUrl
                                                        .split('/')
                                                        .last,
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                  Icon(Icons.description,
                                                      color: Colors.blue),
                                                ],
                                              );
                                            } else {
                                              return Text(
                                                "Update",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  BlocBuilder<PdfdownloadBloc,
                                      PdfdownloadState>(
                                    builder: (context, state) {
                                      if (state is Resumeuploadsuccess) {
                                        return Column(
                                          
                                          children: [
                                            Icon(
                                              Icons.folder,
                                              color: Color.fromARGB(
                                                  255, 234, 214, 32),
                                              size: 80,
                                            ),
                                            Text('Resume Uploaded')
                                          ],
                                        );
                                      } else {
                                        return Center(
                                          child: IconButton(
                                            onPressed: () {
                                              _pickupanduploadcv(
                                                  context, useruid!);
                                            },
                                            icon: Icon(
                                              Icons.upload,
                                              color: Colors.grey,
                                              size: 50,
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
                          SizedBox(height: 20,),
                          Card(
                            child: Container(
                              height: 100,
                              width: 370,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Profile Summery",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text("add",
                                          style: TextStyle(color: Colors.blue)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "Highlight your key career acievements to help employers know yor pitential"),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ]);
            }
            return Center();
          },
        ),
      ),
    );
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
