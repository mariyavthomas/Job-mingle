import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/apply_button.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/interview_time.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/location.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/salary.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/skills.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/whatsapp_button.dart';
import 'package:jobmingle/utils/customcolor.dart';

import 'contact_person.dart';

class AllJobdetails extends StatelessWidget {
  const AllJobdetails({
    super.key,
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

  final User? _currentuser;
  final Map<String, dynamic> _userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
      child: Stack(children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                "${widget.job.jobtitle}",
                style: TextStyle(
                    color: CustomColor.bluecolor(),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Salary(
              widget: widget,
              height: height,
            ),
            Divider(
              color: Colors.black,
              thickness: height * 0.001,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Location(
                widget: widget,
                width: width,
              ),
            ),
            SizedBox(
              height: height * 0.010,
            ),
            Qulification(
              widget: widget,
              height: height,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "INTERVIEW DETAILS",
              style: TextStyle(
                  color: CustomColor.blckcolor(), fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 1,
              color: CustomColor.graycolor(),
            ),
            InterviewTime(width: width),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(widget.job.interviewtime),
            ),
            ContactPerson(width: width),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(widget.job.contactpersonname.toUpperCase()),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            WhatsappButton(widget: widget, width: width, height: height),
            SizedBox(
              height: height * 0.02,
            ),
            Text("Don't pay money to HR of not mentioned in job details"),
            SizedBox(
              height: height * 0.01,
            ),
            Skills(height: height, widget: widget),
            SizedBox(
              height: height * 0.1,
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
        ApplyButton(
            width: width,
            widget: widget,
            currentuser: _currentuser,
            userData: _userData),
      ]),
    );
  }
}
