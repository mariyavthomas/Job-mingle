import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({
    super.key,
    required this.width,
    required this.widget,
    
    required User? currentuser,
    
    required Map<String, dynamic> userData,
  }) : _currentuser = currentuser, _userData = userData;

  final double width;
  final DetailsJob widget;
 
  final User? _currentuser;
  
  
  final Map<String, dynamic> _userData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          SizedBox(
            width: width * 0.25,
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoaedState) {
                return ElevatedButton(
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll(BorderSide(
                          color: CustomColor.whitecolor(),
                        )),
                        backgroundColor: MaterialStatePropertyAll(
                            CustomColor.bluecolor()),
                        minimumSize: MaterialStateProperty.all(
                            Size(170, 45)), // Set the minimum size
                        maximumSize: MaterialStateProperty.all(
                          Size(170, 45),
                        )),
                    onPressed: () {
                      final applyjob = AppliedJobModel(
                          companyuid: widget.job.companyuid!,
                          education: widget.job.qualification,
                          experience: widget.job.experience,
                          jobid: widget.job.jobid,
                          skills: widget.job.skill,
                          userid: state.user.uid!,
                          username: state.user.name!,
                          companyname: widget.job.companyname,
                          experiencecomp: widget.job.experience,
                          interviewtime: widget.job.interviewtime,
                          jobaddress: widget.job.jobaddress,
                          jobtiming: widget.job.jobtime,
                          jobtitle: widget.job.jobtitle,
                          qualification: widget.job.qualification,
                          salary: widget.job.salary!,
                          // username: _userData['username'] ?? "",
                          companycontactperson:
                              widget.job.contactpersonname,
                          companyphonenumber:
                              widget.job.contactpersonnumber,
                          conpanycontactpersonumber:
                              widget.job.companyemail,
                          usercourse: state.user.course!,
                          usercourseendingyear:
                              state.user.courseendingyear!,
                          usercousestaringyear:
                              state.user.courseStaringyear!,
                          userexperence: state.user.experence!,
                          usergrade: state.user.grade!,
                          userhigereducation: state.user.education!,
                          usermailid: state.user.email!,
                          userphonenumber: state.user.phone!,
                          userresume: state.user.resume!,
                          userspecialice:
                              state.user.specialization!,
                          useruniversity: state
                              .user.universitynamecollegename!);

                      context
                          .read<ApplyjobBloc>()
                          .add(ApplyjobUser(applyjob: applyjob));

                      WidgetsBinding.instance
                          .addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content:
                              Text('Successfully Applyed Job '),
                          backgroundColor: Colors.green,
                        ));

                        WidgetsBinding.instance
                            .addPostFrameCallback((_) {
                          Future.delayed(Duration(seconds: 2), () {
                            // Navigator.pop(context);
                          });
                        });
                      });
                    },
                    child: Text(
                      "Apply",
                      style: TextStyle(color: Colors.white),
                    ));
              }
              return ElevatedButton(
                  style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                        color: CustomColor.whitecolor(),
                      )),
                      backgroundColor: MaterialStatePropertyAll(
                          CustomColor.bluecolor()),
                      minimumSize: MaterialStateProperty.all(
                          Size(170, 45)), // Set the minimum size
                      maximumSize: MaterialStateProperty.all(
                        Size(170, 45),
                      )),
                  onPressed: () {
                    final applyjob = AppliedJobModel(
                        companyuid: widget.job.companyuid!,
                        education: widget.job.qualification,
                        experience: widget.job.experience,
                        jobid: widget.job.jobid,
                        skills: widget.job.skill,
                        userid: _currentuser!.uid,
                        username: _currentuser!.displayName!,
                        companyname: widget.job.companyname,
                        experiencecomp: widget.job.experience,
                        interviewtime: widget.job.interviewtime,
                        jobaddress: widget.job.jobaddress,
                        jobtiming: widget.job.jobtime,
                        jobtitle: widget.job.jobtitle,
                        qualification: widget.job.qualification,
                        salary: widget.job.salary!,
                        // username: _userData['username'] ?? "",
                        companycontactperson:
                            widget.job.contactpersonname,
                        companyphonenumber:
                            widget.job.contactpersonnumber,
                        conpanycontactpersonumber:
                            widget.job.companyemail,
                        usercourse: _userData['course'] ?? "",
                        usercourseendingyear:
                            _userData['courseendingyear'] ?? "",
                        usercousestaringyear:
                            _userData['courseStaringyear'] ?? "",
                        userexperence: _userData['experence'] ?? "",
                        usergrade: _userData['grade'] ?? "",
                        userhigereducation:
                            _userData['higereducation'] ?? "",
                        usermailid: _userData['email'] ?? "",
                        userphonenumber: _userData['phone'] ?? "",
                        userresume: _userData['resume'] ?? "",
                        userspecialice:
                            _userData['specialization'] ?? "",
                        useruniversity: _userData[
                                'universitynamecollegename'] ??
                            "");

                    context
                        .read<ApplyjobBloc>()
                        .add(ApplyjobUser(applyjob: applyjob));

                    WidgetsBinding.instance
                        .addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        content: Text('Successfully Applyed Job '),
                        backgroundColor: Colors.green,
                      ));

                      WidgetsBinding.instance
                          .addPostFrameCallback((_) {
                        Future.delayed(Duration(seconds: 2), () {
                          // Navigator.pop(context);
                        });
                      });
                    });
                  },
                  child: Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

