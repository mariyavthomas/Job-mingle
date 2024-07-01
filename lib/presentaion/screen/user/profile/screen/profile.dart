import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobmingle/application/Update_pic/update_pic_bloc.dart';

import 'package:jobmingle/application/Update_pic/update_pic_state.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/infrastructure/Repo/uploadimgerepo.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/intriduction.dart';
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
              String ? useruid= state.user.uid;
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
                                      name: state.user.name,
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
                                  state.user.name.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                              ),
                              Icon(
                                Icons.edit,
                                color: CustomColor.bluelight(),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
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
                                      Text(state.user.email),
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
                                      Text(state.user.phone),
                                    ],
                                  ),
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
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is Pdfuploadsuccess) {
              return Center(
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.upload_sharp,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
              );
            } else {
              return Center(
                child: IconButton(
                  onPressed: () {
                    //_pickupanduploadcv(context, useruid!);
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
  Future<void>_pickupanduploadcv(BuildContext context ,String uid) async{
    try{
   FilePickerResult ? result =await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions:['jpg', 'pdf', 'doc']);
    if(result !=null && result.files.isNotEmpty){
      PlatformFile file =result.files.first;
      print('mariya');
      print(file);
      final profileBloc =BlocProvider.of<ProfileBloc>(context);
      final profileState= profileBloc.state;
      if(profileState is UserProfileLoaedState){
        final String? uid =profileState.user.uid;
        profileBloc.add(PickAndUploadPdf(file: file, uid: uid!));
      }
      else{
         throw Exception('User not loaded');
      }
  
      
    }
    }
    catch(e){
       print("Error picking and uploading PDF: $e");
    }
  }
}
