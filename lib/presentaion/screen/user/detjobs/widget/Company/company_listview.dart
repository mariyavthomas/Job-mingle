import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class CompanyListView extends StatelessWidget {
  const CompanyListView({
    super.key,
    required this.height,
    required this.widget,
  });

  final double height;
  final DetailsJob widget;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        CircleAvatar(
          maxRadius: height * 0.09,
          backgroundImage: AssetImage(
              'lib/assests/images/corporate-business-handshake-business-partners.jpg'),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Center(
            child: Text(
          widget.job.companyname,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: CustomColor.bluecolor()),
        )),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 231, 231)),
          height: height * 0.01,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

