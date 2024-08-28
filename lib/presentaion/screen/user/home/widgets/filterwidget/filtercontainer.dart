import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:icons_launcher/utils/icon.dart'  as launcher_icon;
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:jobmingle/utils/customtext/customtext.dart';

import 'filterrow.dart';

class Filtercontainer extends StatelessWidget {
  const Filtercontainer({
    super.key,
    required this.job,
    required this.height,
    required this.width,
  });

  final JobModel job;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsJob(job: job)));
        },
        child: Container(
          height: height * 0.18, // Adjust height as needed
          width: width * 0.6,
          decoration: BoxDecoration(
            border: Border.all(color: CustomColor.bluelight()),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: job.jobtitle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomText(
                      text: "Rs.${job.salary}",
                      color: CustomColor.bluecolor(),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    FilterCutomRow(
                      job: job,
                      color: Color.fromARGB(255, 242, 163, 90),
                      fontSize: 15,
                      text: job.city,
                      icon: Icons.location_on_outlined,
                    ),
                    SizedBox(
                      height: height * 0.005
                    ),
                    FilterCutomRow(
                      job: job,
                      color: Color.fromARGB(255, 242, 163, 90),
                      fontSize: 15,
                      text: job.companyname,
                      icon: Icons.business,
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsJob(job: job)));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: CustomColor.bluecolor(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
