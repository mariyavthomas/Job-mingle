import 'package:flutter/material.dart';
import 'package:jobmingle/infrastructure/Repo/commanrepo.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/report_button.dart';

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

           CommanRepo().whatsapp(message: message);
              
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
  
}

