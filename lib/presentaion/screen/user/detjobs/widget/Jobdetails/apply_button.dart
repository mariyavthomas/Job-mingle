import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class ApplyButton extends StatefulWidget {
  const ApplyButton({
    super.key,
    required this.width,
    required this.widget,
    required User? currentuser,
    required Map<String, dynamic> userData,
  })  : _currentuser = currentuser,
        _userData = userData;

  final double width;
  final DetailsJob widget;

  final User? _currentuser;

  final Map<String, dynamic> _userData;

  @override
  State<ApplyButton> createState() => _ApplyButtonState();
}

class _ApplyButtonState extends State<ApplyButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          SizedBox(
            width: widget.width * 0.25,
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoaedState) {
                return ElevatedButton(
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll(BorderSide(
                      color: CustomColor.whitecolor(),
                    )),
                    backgroundColor:
                        MaterialStatePropertyAll(CustomColor.bluecolor()),
                    minimumSize: MaterialStateProperty.all(
                        Size(170, 45)), // Set the minimum size
                    maximumSize: MaterialStateProperty.all(
                      Size(170, 45),
                    ),
                  ),
                  onPressed: () async {
                    final applyjob = AppliedJobModel(
                      useraddress: widget._userData['address'] ?? "",
                      userworkstatus: widget._userData['workstatus'] ?? "",
                      usercurrentcategory:
                          widget._userData['currentcategory'] ?? "",
                      usercurrentcity: widget._userData['currentcity'] ?? "",
                      usercurrentdeparment:
                          widget._userData['currentdeparment'] ?? "",
                      usercurrentindustry:
                          widget._userData['currentindustry'] ?? "",
                      usercurrentjobrole:
                          widget._userData['currentjobrole'] ?? "",
                      userdob: widget._userData['dob'] ?? "",
                      usergender: widget._userData['gender'] ?? "",
                      userhometown: widget._userData['hometown'] ?? "",
                      userlanguage: widget._userData['language'] ?? "",
                      userpincode: widget._userData['pincode'] ?? "",
                      userprofileheadlines:
                          widget._userData['profileheadlines'] ?? "",
                      userprofilesummery:
                          widget._userData['profilesummery'] ?? "",
                      useruserjobtitle: widget._userData['jobtitle'] ?? "",
                      pic: widget._userData['pic'] ?? "",
                      jobPostedDate: widget.widget.job.dateofposting,
                      city: widget.widget.job.city,
                      country: widget.widget.job.country,
                      state: widget.widget.job.state,
                      companyuid: widget.widget.job.companyuid!,
                      education: widget.widget.job.qualification,
                      experience: widget.widget.job.experience,
                      jobid: widget.widget.job.jobuid,
                      skills: widget.widget.job.skill,
                      userid: state.user.uid!,
                      username: state.user.name!,
                      companyname: widget.widget.job.companyname,
                      experiencecomp: widget.widget.job.experience,
                      interviewtime: widget.widget.job.interviewtime,
                      jobaddress: widget.widget.job.jobaddress,
                      jobtiming: widget.widget.job.jobtime,
                      jobtitle: widget.widget.job.jobtitle,
                      qualification: widget.widget.job.qualification,
                      salary: widget.widget.job.salary!,
                      companycontactperson: widget.widget.job.contactpersonname,
                      companyphonenumber: widget.widget.job.contactpersonnumber,
                      conpanycontactpersonumber: widget.widget.job.companyemail,
                      usercourse: state.user.course!,
                      usercourseendingyear: state.user.courseendingyear!,
                      usercousestaringyear: state.user.courseStaringyear!,
                      userexperence: state.user.experence!,
                      usergrade: state.user.grade!,
                      userhigereducation: state.user.education ?? "hai",
                      usermailid: state.user.email!,
                      userphonenumber: state.user.phone!,
                      userresume: widget._userData['downloadUrl'] ?? "",
                      userspecialice: state.user.specialization!,
                      useruniversity: state.user.universitynamecollegename!,
                    );

                    final querySnapshot = await FirebaseFirestore.instance
                        .collection('applyjob')
                        .where('jobid', isEqualTo: widget.widget.job.jobuid)
                        .where('userid', isEqualTo:widget._currentuser!.uid)
                       
                        .get();

                    if (querySnapshot.docs.isNotEmpty) {
                      Fluttertoast.showToast(
                        msg: "Already Applied for This Job",
                        backgroundColor: Colors.red,
                        gravity: ToastGravity.BOTTOM_LEFT,
                      );
                    } else {
                      context
                          .read<ApplyjobBloc>()
                          .add(ApplyjobUser(applyjob: applyjob));
                      Fluttertoast.showToast(
                        msg: "Successfully Applied for Job",
                        backgroundColor: Colors.green,
                        gravity: ToastGravity.BOTTOM,
                      );
                    }
                  },
                  child: Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _applyJob(BuildContext context, AppliedJobModel applyjob) async {
    final jobuid = applyjob.jobid;
    final useruid = FirebaseAuth.instance.currentUser?.uid;

    if (useruid == null) {
      Fluttertoast.showToast(
        msg: "User is not authenticated",
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM_LEFT,
      );
      return;
    }

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('applyjob')
          .where('jobid', isEqualTo: jobuid)
          .where('userid', isEqualTo: useruid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Fluttertoast.showToast(
          msg: "Already Applied for This Job",
          backgroundColor: Colors.red,
          gravity: ToastGravity.BOTTOM_LEFT,
        );
      } else {
        context.read<ApplyjobBloc>().add(ApplyjobUser(applyjob: applyjob));
        Fluttertoast.showToast(
          msg: "Successfully Applied for Job",
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
