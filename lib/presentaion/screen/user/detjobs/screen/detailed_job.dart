// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailsJob extends StatefulWidget {
  DetailsJob({super.key, required this.job});

  JobModel job;

  @override
  State<DetailsJob> createState() => _DetailsJobState();
}

class _DetailsJobState extends State<DetailsJob> {
  
void whatsapp({required String message}) async{
   var contact = "";
   final String encodedmessage=Uri.encodeComponent(message);
   var androidUrl = "whatsapp://send?phone=$contact&text=$encodedmessage";
   var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
   
   try{
      if(Platform.isIOS){
         await launchUrl(Uri.parse(iosUrl));
      }
      else{
         await launchUrl(Uri.parse(androidUrl));
      }
   } on Exception{
    //  EasyLoading.showError('WhatsApp is not installed.');
  }
}


  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.job.companyname),
          backgroundColor: CustomColor.bluecolor(),
          bottom: TabBar(
            tabs: [
              Tab(text: 'JOB DETAILS'),
              Tab(text: 'COMPANY DETAILS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
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
                    ListTile(
                        leading: Text(
                          '₹ ${widget.job.salary}',
                          style: TextStyle(
                              color: CustomColor.bluecolor(),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        title: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          height: height * 0.025,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: Text(
                              '${widget.job.numberofopening} openings',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline))),
                    Divider(
                      color: Colors.black,
                      thickness: height * 0.001,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: CustomColor.graycolor(),
                            size: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: CustomColor.graycolor(),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${widget.job.city}')
                            ],
                          ),
                          SizedBox(
                            width: width * 0.25,
                          ),
                          Icon(
                            Icons.star_half,
                            color: CustomColor.graycolor(),
                            size: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Experience",
                                style: TextStyle(
                                    color: CustomColor.graycolor(),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${widget.job.experience}')
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Expanded(
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
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "INTERVIEW DETAILS",
                      style: TextStyle(
                          color: CustomColor.blckcolor(),
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      thickness: 1,
                      color: CustomColor.graycolor(),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_rounded,
                          color: CustomColor.graycolor(),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Text(
                          "Interview Time",
                          style: TextStyle(color: CustomColor.graycolor()),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(widget.job.interviewtime),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: CustomColor.graycolor(),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Text(
                          " Contact Person",
                          style: TextStyle(color: CustomColor.graycolor()),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(widget.job.contactpersonname.toUpperCase()),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
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
              String description =widget.job.jobdecripation ;
              String jobaddress = widget.job.jobaddress;
              String message="jobTitle:$jobTitle \n"
                             "Company:$company \n "
                             "Location:$location\n "
                             "Description:$description \n"
                             "jobaddress :$jobaddress \n";

                              whatsapp(message: message);
                              // launchwhatsapp(number:"+917591991563", message: "hello");
                            },
                            icon: Icon(Icons.share),
                            label: Text('Share Job WhatsApp')),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Container(
                          height: height * 0.043,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                              child: Text(
                            "Report Job",
                            style: TextStyle(color: Colors.red),
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                        "Don't pay money to HR of not mentioned in job details"),
                        
                        SizedBox(
                          height:  height *0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(color: CustomColor.bluelight(),borderRadius:BorderRadius.circular(5) ),
                          height: height *0.1,
                         child: Column(
                          children: [
                            Text("Simpilar Job"),
                            SizedBox(
                              height: height *0.01,
                            ),
                            Text("We picked out a few more jobs that are similar to this one. Apply for more jonbs to increase change of getting hired. ",style: TextStyle(color: Colors.grey),)
                          ],
                         ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: height *0.1,
                        )
                   
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            side: MaterialStatePropertyAll(BorderSide(color: Colors.green,)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              minimumSize: MaterialStateProperty.all(
                                  Size(170, 45)), // Set the minimum size
                              maximumSize: MaterialStateProperty.all(
                                Size(170, 45),
                              )),
                          onPressed: () {},
                          child: Text("Apply",style: TextStyle(color: Colors.green),)),
                          SizedBox(
                            width:  width * 0.09,
                          ),
                           ElevatedButton(
                          style: ButtonStyle(
                            
                              backgroundColor:
                                  MaterialStatePropertyAll(CustomColor.bluecolor()),
                              minimumSize: MaterialStateProperty.all(
                                  Size(130, 45)), // Set the minimum size
                              maximumSize: MaterialStateProperty.all(
                                Size(130, 45),
                              )),
                          onPressed: () {},
                          child: Text("Similar Job",style: TextStyle(color: Colors.white),))
                    ],
                  ),
                )
              ]),
            ),
            ListView()
          ],
        ),
      ),
    );
  }
}
