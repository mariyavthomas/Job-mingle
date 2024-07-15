import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Qulification extends StatelessWidget {
  const Qulification({
    super.key,
    required this.widget,
    required this.height,
    
  });

  final DetailsJob widget;
  final double height;
 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: CustomColor.blckcolor(),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Qualification:  '),
                    TextSpan(
                      text: '${widget.job.qualification}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: CustomColor.graycolor()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: CustomColor.blckcolor(),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Job Info:  '),
                    TextSpan(
                      text: '${widget.job.jobdecripation}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: CustomColor.graycolor()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: CustomColor.blckcolor(),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Job Timing :  '),
                    TextSpan(
                      text: '${widget.job.jobtime}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: CustomColor.graycolor()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: CustomColor.blckcolor(),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Job Address:  '),
                    TextSpan(
                      text: '${widget.job.jobaddress}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: CustomColor.graycolor()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

