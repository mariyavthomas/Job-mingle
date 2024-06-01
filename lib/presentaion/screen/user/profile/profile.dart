import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/utils/customcolor.dart';

import '../bottamnaviationbar/widgets/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: CustomColor.graycolor(),
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: CustomColor.graycolor(),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: (){},
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
                             Icon(Icons.edit_square,color: CustomColor.bluelight(),)
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 300,
                            width: 370,
                            
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children:[ 
                                     SizedBox(
                                width: 40,
                              ),
                                    Text("Basic details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                   ,
                                    SizedBox(
                                width: 160,
                              ),
                                   Icon(Icons.edit_square,color: CustomColor.bluelight(),)
                              ]
                              ),
                              SizedBox(height: 30,),

                              Row(
                                children: [
                                  Icon(Icons.mail,color: Colors.grey,),
                                  SizedBox(width: 15,),
                                  Text(state.user.email),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                    Icon(Icons.call,color: Colors.grey,),
                                  SizedBox(width: 15,),
                                  Text(state.user.phone),
                                ],
                              ),
                             
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
