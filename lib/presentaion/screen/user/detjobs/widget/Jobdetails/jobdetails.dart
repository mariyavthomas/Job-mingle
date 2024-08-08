import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/allJob.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/jobdetails.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/apply_button.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/interview_time.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/location.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/salary.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/skills.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/whatsapp_button.dart';
import 'package:jobmingle/utils/customcolor.dart';

import 'contact_person.dart';

class AllJobdetails extends StatefulWidget {
  AllJobdetails({
    super.key,
    this.isFavorited,
    required this.widget,
    required this.height,
    required this.width,
    required User? currentuser,
    required Map<String, dynamic> userData,
  })  : _currentuser = currentuser,
        _userData = userData;

  final DetailsJob widget;

  final double height;

  final double width;
  final bool? isFavorited;
  final User? _currentuser;
  final Map<String, dynamic> _userData;

  @override
  State<AllJobdetails> createState() => _AllJobdetailsState();
}

class _AllJobdetailsState extends State<AllJobdetails> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllJobsBloc>().add(FilterJobsByName(jobtitle: widget.widget.job.jobtitle));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Text(
                        "${widget.widget.job.jobtitle}",
                        style: TextStyle(
                          color: CustomColor.bluecolor(),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Salary(
                      isFavorited: widget.isFavorited,
                      widget: widget.widget,
                      height: widget.height,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: widget.height * 0.001,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Location(
                        widget: widget.widget,
                        width: widget.width,
                      ),
                    ),
                    SizedBox(
                      height: widget.height * 0.010,
                    ),
                    Qulification(
                      widget: widget.widget,
                      height: widget.height,
                    ),
                    SizedBox(
                      height: widget.height * 0.03,
                    ),
                    Text(
                      "INTERVIEW DETAILS",
                      style: TextStyle(
                        color: CustomColor.blckcolor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: CustomColor.graycolor(),
                    ),
                    InterviewTime(width: widget.width),
                    SizedBox(
                      height: widget.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(widget.widget.job.interviewtime),
                    ),
                    ContactPerson(width: widget.width),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(widget.widget.job.contactpersonname.toUpperCase()),
                    ),
                    SizedBox(
                      height: widget.height * 0.02,
                    ),
                    WhatsappButton(
                      widget: widget.widget,
                      width: widget.width,
                      height: widget.height,
                    ),
                    SizedBox(
                      height: widget.height * 0.02,
                    ),
                    Text("Don't pay money to HR of not mentioned in job details"),
                    SizedBox(
                      height: widget.height * 0.01,
                    ),
                    Skills(
                      height: widget.height,
                      widget: widget.widget,
                    ),
                    SizedBox(
                      height: widget.height * 0.01,
                    ),
                    Expanded(
                      child: Container(
                        height: widget.height* 0.12,
                        width: widget.width*0.03,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 223, 241, 255),borderRadius: BorderRadius.circular(10)),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: widget.height*0.01,
                            ),
                          Text("Similar Jobs",style: TextStyle(color: Colors.black,fontSize: 20),),
                          Text("We picked out a few more jobs that are Similar to this one.Apply for more jobs to increase changes of getting hired.")
                         ],),
                       )
                      ),
                    ),
                    SizedBox(
                      height: widget.height *0.01,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    BlocBuilder<GetAllJobsBloc, GetAllJobsState>(
                      builder: (context, state) {
                        if (state is JobLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is FilteredJobLoaded) {
                          final filter = state.filteredjobs;
                          print("filter");
                          print(filter.length);
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filter.length,
                            itemBuilder: (BuildContext context, int index) {
                              final JobModel jobModel = filter[index];
                              return Jobdetails(job: jobModel, height: widget.height, width: widget.width);;
                            },
                          );
                        }
                        return Center();
                      },
                    ),
                    // SizedBox(
                    //   height: 80,
                    // ),
                  ],
                ),
              ),
            ],
          ),
          ApplyButton(
            width: widget.width,
            widget: widget.widget,
            currentuser: widget._currentuser,
            userData: widget._userData,
          ),
        ],
      ),
    );
  }
}
