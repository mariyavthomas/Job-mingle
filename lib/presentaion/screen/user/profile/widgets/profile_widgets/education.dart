import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/neweducation.dart';
import 'package:jobmingle/utils/customcolor.dart';

// ignore: must_be_immutable
class Education extends StatefulWidget {
  Education({super.key, required this.user});
  Usermodel user;
  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<ProfileBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.cast_for_education,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Education",
                      style: TextStyle(
                        fontSize: 19,
                        color: CustomColor.blckcolor(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddnewEducation1(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit_square,
                        color: CustomColor.bluelight(),
                      )),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "${widget.user.course}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.user.specialization!,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(widget.user.universitynamecollegename!),
              SizedBox(
                height: 5,
              ),
              Text(
                  "${widget.user.courseStaringyear!},${widget.user.courseendingyear}, .${widget.user.coursetype}",
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
