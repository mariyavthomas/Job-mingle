import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/report_button.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappButton extends StatelessWidget {
  const WhatsappButton({
    super.key,
    required this.widget,
    
    
    required this.width,
    required this.height,
  });

  final DetailsJob widget;
  
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.green)),
            onPressed: () {
              // Define job details
              String jobTitle = widget.job.jobtitle;
              String company = widget.job.companyname;

              String location = widget.job.city;
              String description = widget.job.jobdecripation;
              String jobaddress = widget.job.jobaddress;
              String message = "jobTitle:$jobTitle \n"
                  "Company:$company \n "
                  "Location:$location\n "
                  "Description:$description \n"
                  "jobaddress :$jobaddress \n";

              whatsapp(message: message);
              
            },
            icon: Icon(Icons.share),
            label: Text('Share Job WhatsApp')),
        SizedBox(
          width: width * 0.04,
        ),
        ReportButton(height: height, width: width)
      ],
    );
  }
  void whatsapp({required String message}) async {
    var contact = "";
    final String encodedmessage = Uri.encodeComponent(message);
    var androidUrl = "whatsapp://send?phone=$contact&text=$encodedmessage";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      //  EasyLoading.showError('WhatsApp is not installed.');
    }
  }
}

