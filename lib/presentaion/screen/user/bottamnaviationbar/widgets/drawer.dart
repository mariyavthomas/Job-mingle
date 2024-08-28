import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/profilemain.dart';
import 'package:jobmingle/utils/customcolor.dart';

ClipRRect drawer() {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
    child: Drawer(
      elevation: 20,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoaedState) {
            return ListView(children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              maxRadius: 40,
                              backgroundColor: CustomColor.graycolor(),
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: CustomColor.graycolor(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      state.user.name!.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 18),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage()));
                                        },
                                        child: Text(
                                          'Update profile',
                                          style: TextStyle(
                                              color: CustomColor.bluecolor()),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                )),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                  ),
                )
              ]),
            ]);
          }
          return Center();
        },
      ),
      clipBehavior: Clip.hardEdge,
    ),
  );
}
