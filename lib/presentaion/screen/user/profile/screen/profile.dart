import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/utils/customcolor.dart';

import '../../bottamnaviationbar/widgets/drawer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  bool isedit = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoaedState) {
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 230,
                                        ),
                                        TextButton(
                                          onPressed: () {
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
                                                      Color.fromARGB(
                                                          200, 75, 110, 225))),
                                          onPressed: () {},
                                          child: Text('Camera'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: Color.fromARGB(255, 176, 176, 176),
                        child: Icon(
                          Icons.person_add,
                          size: 40,
                          color: CustomColor.graycolor(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                              ),
                              Text(
                                state.user.name.toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Icon(
                                Icons.edit_square,
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
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 200,
                                        ),
                                        Text(
                                          "Update",
                                          style: TextStyle(color: Colors.blue),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.upload,
                                            color: Colors.grey,
                                            size: 50,
                                          )))
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
}
