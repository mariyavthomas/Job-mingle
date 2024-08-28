import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/Update_pic/update_pic_bloc.dart';
import 'package:jobmingle/application/Update_pic/update_pic_state.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/picture.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/profile_widgets/profile_name.dart';
import 'package:jobmingle/utils/customcolor.dart';

// ignore: must_be_immutable
class Profile_Image extends StatefulWidget {
  Profile_Image({super.key, required this.user});
  Usermodel? user;

  @override
  State<Profile_Image> createState() => _Profile_ImageState();
}

class _Profile_ImageState extends State<Profile_Image> {
  @override
  void initState() {
  
    super.initState();
    //context.read<ProfileBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        widget.user?.pic != null
            ? InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePicture(user: widget.user!,)));
                },
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(widget.user!.pic!),
                ),
              )
            : InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePicture(user: widget.user!,)));
                },
                child: BlocBuilder<UpdatePicBloc, UpdatePicState>(
                  builder: (context, state) {
                    return CircleAvatar(
                      maxRadius: 60,
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
          width: 10,
        ),
        Profile_name(user: widget.user!),
      ],
    );
  }
}
