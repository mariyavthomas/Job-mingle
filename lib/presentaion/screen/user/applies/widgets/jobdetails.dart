import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/infrastructure/Repo/commanrepo.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/details_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class JobDetailsapply extends StatefulWidget {
  JobDetailsapply({
    super.key,
    required this.height,
    required this.appliedjobs,
    required this.width,
  });

  final double height;
  final AppliedJobModel appliedjobs;
  final double width;

  @override
  State<JobDetailsapply> createState() => _JobDetailsapplyState();
}

class _JobDetailsapplyState extends State<JobDetailsapply> {
  CommanRepo call = CommanRepo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 229, 226, 226),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                height: widget.height * 0.09,
                width: widget.height * 0.08,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 222, 219, 246),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.business,
                  color: CustomColor.bluecolor(),
                ),
              ),
              title: Text(
                widget.appliedjobs.jobtitle.toUpperCase(),
                style: TextStyle(
                  color: CustomColor.bluecolor(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${widget.appliedjobs.companyname}',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenApplyDetailsjob(job: widget.appliedjobs)));
              }, icon: Icon(Icons.arrow_forward_ios)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.money,
                    color: Colors.black,
                  ),
                  SizedBox(width: widget.width * 0.02),
                  Text("Rs.${widget.appliedjobs.salary}",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 10),),
                ],
              ),
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  SizedBox(width: widget.width * 0.01),
                  Text("${widget.appliedjobs.city}",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 10)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 232, 245, 240),
                  ),
                  height: widget.height * 0.08,
                  width: widget.width * 0.8,
                  child: Center(
                    child: Text(
                      'Applied Successfully',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  SizedBox(width: widget.width * 0.01),
                  Text(
                      "${widget.appliedjobs.companycontactperson.toUpperCase()}"),
                  SizedBox(
                    width: widget.width * 0.48,
                  ),
                  CircleAvatar(
                      backgroundColor: CustomColor.bluelight(),
                      child: IconButton(
                          onPressed: () {
                            call.makePhoneCall(
                                widget.appliedjobs.conpanycontactpersonumber);
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.blue,
                          ))),
                  SizedBox(
                    width: widget.width * 0.03,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 199, 219, 200),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            print(widget.appliedjobs.companyphonenumber);
                            CommanRepo().shareNumberOnWhatsApp(widget.appliedjobs.companyphonenumber,'Hello Mam/Sir');
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                            size: 27,
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: widget.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}
