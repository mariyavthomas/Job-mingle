import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmingle/application/candidatestatus/candidatestatus_bloc.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/detailwidgets.dart/first_container.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/detailwidgets.dart/first_listtile.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/detailwidgets.dart/firstrow.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/detailwidgets.dart/fourth_row.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/detailwidgets.dart/secondrow.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/detailwidgets.dart/third_row.dart';


class ScreenApplyDetailsjob extends StatefulWidget {
  const ScreenApplyDetailsjob({super.key, required this.job});
  final AppliedJobModel job;

  @override
  State<ScreenApplyDetailsjob> createState() => _ScreenApplyDetailsjobState();
}

class _ScreenApplyDetailsjobState extends State<ScreenApplyDetailsjob> {
  @override
  void initState() {
    context.read<CandidatestatusBloc>().add(Fetchstatus());
    super.initState();
  }

  late Usermodel user;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String status = widget.job.candidatestatus ?? 'Applied';

    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case 'Shortlisted':
        statusColor = Colors.green;
        // ignore: deprecated_member_use
        statusIcon = FontAwesomeIcons.checkCircle;
        break;
      case 'Rejected':
        statusColor = Colors.red;
        // ignore: deprecated_member_use
        statusIcon = FontAwesomeIcons.timesCircle;
        break;
      default:
        statusColor = Colors.orange;
        statusIcon = FontAwesomeIcons.hourglassHalf;
    }

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: 10),
              Firstrow(),
              SecondRow(
                width: width,
                height: height,
                widget: widget,
              ),
              Firstlisttile(
                widget: widget,
              ),
              ThirdRow(width: width, widget: widget),
              SizedBox(height: height * 0.01),
              FourthRow(width: width, widget: widget),
              SizedBox(height: height * 0.03),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Application Status',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              FirstContainer(statusColor: statusColor, statusIcon: statusIcon, status: status),
              SizedBox(
                height: height * 0.4,
              ),
              // if (status == 'Shortlisted')
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         primary: Colors.green, // Background color
              //         onPrimary: Colors.white, // Text color
              //         elevation: 10, // Shadow effect
              //         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         side: BorderSide(
              //           color: Colors.white, // Border color
              //           width: 2, // Border width
              //         ),
              //       ),
              //       onPressed: () {
              //        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatsScreen(userModel:widget.job,)));
              //       },
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Icon(
              //             FontAwesomeIcons.solidComments,
              //             color: Colors.white,
              //             size: 20,
              //           ),
              //           SizedBox(width: 10),
              //           Text(
              //             "Chat with HR",
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              SizedBox(height: 20), // Add some spacing
            ],
          ),
        ],
      ),
    );
  }
}

