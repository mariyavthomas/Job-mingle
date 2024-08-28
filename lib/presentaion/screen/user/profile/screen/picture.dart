import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/Update_pic/update_pic_bloc.dart';
import 'package:jobmingle/application/Update_pic/update_pic_event.dart';
import 'package:jobmingle/application/Update_pic/update_pic_state.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/infrastructure/Repo/uploadimgerepo.dart';
import 'package:jobmingle/utils/customcolor.dart';

// ignore: must_be_immutable
class ProfilePicture extends StatelessWidget {
  ProfilePicture({super.key,required this.user});
  Usermodel user;
  ImageRepo imagefire = ImageRepo();
  String? pickedImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: CustomColor.graycolor(),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Profile picture',
                  style: TextStyle(
                      color: CustomColor.blckcolor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  """ Profile with photo has 40% hiher chance of gettong noticed by recruiters""",
                  style:
                      TextStyle(color: CustomColor.graycolor(), fontSize: 15),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 19),
                    child: CircleAvatar(
                      //  backgroundImage: NetworkImage(!),
                      maxRadius: 102,
                      backgroundColor: Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.0)),
                              ),
                              builder: (BuildContext context) {
                                // ignore: unused_label

                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 16.0),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Upload Profile Picture Via',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: CustomColor.blckcolor(),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 24.0),
                                      BlocBuilder<UpdatePicBloc,
                                          UpdatePicState>(
                                        builder: (context, state) {
                                          // if(state is UploadImageSuccess){
                                          //   // pickedImage=state.image?.path;
                                          // }
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  // ignore: unused_local_variable
                                                  context.read<UpdatePicBloc>().add(
                                                      UploadCameraPictureEvent());
                                                  //   context.read<ProfileBloc>().add(GetUserEvent());
                                                  // context
                                                  //     .read<UpdatePicBloc>()
                                                  //     .add(SaveEvent());
                                                  pickedImage != null
                                                      ? FileImage(
                                                          File(pickedImage!))
                                                      : null;

                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          200, 75, 110, 225)),
                                                ),
                                              ),
                                              //SizedBox(width: 100),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Color.fromARGB(200,
                                                                75, 110, 225))),
                                                onPressed: () async {
                                                  context.read<UpdatePicBloc>().add(
                                                      UploadgalleryPictureEvent());
                                                  //imagefire.uploadImageToFirebase(File(state.file!.path));
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Camera'),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: BlocBuilder<UpdatePicBloc, UpdatePicState>(
                          builder: (context, state) {
                            return CircleAvatar(
                              maxRadius: 100,
                              backgroundImage: state.file != null
                                  ? FileImage(File(state.file!.path))
                                  : null,
                              backgroundColor:
                                  Color.fromARGB(255, 139, 137, 137),
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
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ''' Supported file formate:PNG ,JPG,GIF MAXIMUM FILE Size upto 2 MB''',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 18),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  BlocBuilder<UpdatePicBloc, UpdatePicState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            context.read<UpdatePicBloc>().add(
                                Uploadfirebaseimage(
                                    file: state.file!,
                                    uid: FirebaseAuth
                                        .instance.currentUser!.uid));
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              context.read<ProfileBloc>().add(GetUserEvent());
                            });

                            Navigator.pop(context);
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: 18),
                          ));
                    },
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
