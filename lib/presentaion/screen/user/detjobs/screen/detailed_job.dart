import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/utils/customcolor.dart';

class DetailsJob extends StatefulWidget {
  DetailsJob({super.key, required this.job});

  JobModel job;

  @override
  State<DetailsJob> createState() => _DetailsJobState();
}

class _DetailsJobState extends State<DetailsJob> {
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
              padding: const EdgeInsets.only(left: 15, top: 10,right: 10),
              child: ListView(
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
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height: height *0.019,
                    
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Text('${widget.job.numberofopening}openings',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline))),
                    Divider(
                      color: Colors.black,
                      thickness: height *0.001,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined,color: CustomColor.graycolor(),size: 30,),
                          
                          Column(
                            children: [
                              Text("Location",style: TextStyle(color: CustomColor.graycolor(),fontWeight: FontWeight.bold),)
                            ,Text('${widget.job.city}')
                            ],
                          ),
                          SizedBox(width: width * 0.25,),
                          Icon(Icons.star_half,color: CustomColor.graycolor(),size: 30,),
                          
                          Column(
                            children: [
                              Text("Experience",style: TextStyle(color: CustomColor.graycolor(),fontWeight: FontWeight.bold),)
                            ,Text('${widget.job.experience}')
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height *0.010,
                    ),
                   Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  
    RichText(
      text: TextSpan(
        style: TextStyle(
          color: CustomColor.graycolor(),
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(text: 'Qualification: '),
          TextSpan(
            text: '${widget.job.qualification}',
            style: TextStyle(fontWeight: FontWeight.normal,color: CustomColor.blckcolor()),
          ),
        ],
      ),
    ),
    // Other widgets in your column
  ],
)
                          ],
              ),
            ),
            ListView()
          ],
        ),
      ),
    );
  }
}
