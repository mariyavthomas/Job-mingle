
import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/utils/customcolor.dart';

import '../../screen/intriduction.dart';

// ignore: must_be_immutable
class Profile_name extends StatefulWidget {
 Profile_name({
    super.key,required this.user
  });
Usermodel user;

  @override
  State<Profile_name> createState() => _Profile_nameState();
}

class _Profile_nameState extends State<Profile_name> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            widget.user.name!.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Introduction(
                          jobtitle: widget.user.jobtitle,
                              name: widget.user.name!,
                              profileheadlines:
                                  widget.user.profileheadlines,
                                  

                            )));
              },
              icon: Icon(
                Icons.edit_square,
                color: CustomColor.bluelight(),
              ))
        ]),
        Text(
          widget.user.phone!.toUpperCase(),
          style: TextStyle(),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.user.email!,
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

