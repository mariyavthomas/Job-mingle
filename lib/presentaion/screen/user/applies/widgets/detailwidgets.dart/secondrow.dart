import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/details_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
   
  });

  final double width;
  final double height;
  final ScreenApplyDetailsjob widget;


  @override
  Widget build(BuildContext context) {
    return Row(
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
                  blurRadius: 10,
                  color: CustomColor.bluecolor().withOpacity(0.3),
                ),
              ],
            ),
            child: Center(
              child: FaIcon(
                Icons.business,
                size: 35,
                color: CustomColor.bluecolor(),
              ),
            ),
          ),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.job.companyname,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

