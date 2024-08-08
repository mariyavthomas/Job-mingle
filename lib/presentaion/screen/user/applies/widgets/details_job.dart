import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/utils/customcolor.dart';

class ScreenApplyDetailsjob extends StatefulWidget {
  const ScreenApplyDetailsjob({super.key, required this.job});
  final AppliedJobModel job;
  
  @override
  State<ScreenApplyDetailsjob> createState() => _ScreenApplyDetailsjobState();
}

class _ScreenApplyDetailsjobState extends State<ScreenApplyDetailsjob> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Function to calculate the difference in days
    // int calculateDaysSincePosted(DateTime postedDate) {
    //   DateTime now = DateTime.now();
    //   Duration difference = now.difference(postedDate);
    //   return difference.inDays;
    // }

    // // Assuming 'postedDate' is a DateTime object in your job model
    // DateTime jobPostedDate = widget.job.jobPostedDate as DateTime; // Replace with actual field from job model
    // int daysSincePosted = calculateDaysSincePosted(jobPostedDate);

    return Scaffold(
        body: Stack(children: [
      ListView(children: [
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: CustomColor.bluecolor(),
                  )),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    Icons.share,
                    color: CustomColor.bluecolor(),
                    size: 30,
                  ))
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width * 0.15,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 142, 146, 223),
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 150, color: CustomColor.bluecolor())
                      ]),
                  child: Center(
                      child: FaIcon(
                    Icons.business,
                    size: 35,
                    color: CustomColor.bluecolor(),
                  ))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.job.jobtitle}",
                    style: TextStyle(
                        color: CustomColor.blckcolor(),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.job.companyname,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
        ListTile(
          leading: Icon(
            Icons.location_on,
            color: CustomColor.bluecolor(),
          ),
          title: Text(
              "${widget.job.country},${widget.job.state},${widget.job.city}"),
        ),
        Row(
          children: [
            SizedBox(
              width: width * 0.05,
            ),
            Icon(
              Icons.money,
              color: CustomColor.bluecolor(),
              size: 27,
            ),
            SizedBox(
              width: width * 0.06,
            ),
            Text("Rs.${widget.job.salary} Annually")
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          children: [
            SizedBox(
              width: width * 0.05,
            ),
            Icon(
              Icons.alarm,
              color: CustomColor.bluecolor(),
              size: 27,
            ),
            SizedBox(
              width: width * 0.06,
            ),
            Text("${widget.job.experiencecomp}, Experience")
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        // Display days since posted
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        //   child: Text(
        //  // 'Posted ${daysSincePosted} days ago',
        //     style: TextStyle(
        //       fontSize: 16.0,
        //       fontWeight: FontWeight.w500,
        //       color: Colors.grey[700],
        //     ),
        //   ),
        // ),
      ])
    ]));
  }
}
