import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/utils/customcolor.dart';

class JobDetailsapply extends StatelessWidget {
  const JobDetailsapply({
    super.key,
    required this.height,
    required this.appliedjobs,
    required this.width,
  });

  final double height;
  final AppliedJobModel appliedjobs;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
         
        },
        child: Container( 
          decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 205, 202, 202),),borderRadius:BorderRadius.all(Radius.circular(10)) ),
          child: Card(
            shadowColor: Colors.grey,
            elevation: 5,
            margin: EdgeInsets.all(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                ListTile(
                  leading: Container(
                    height: height * 0.09,
                    width: height * 0.08,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 231, 231),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.shop)
                  ),
                  title: Text(
                    appliedjobs.jobtitle.toUpperCase(),
                    style: TextStyle(
                      color: CustomColor.bluecolor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Rs.${appliedjobs.salary}',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ),
               
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_city_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(width: width * 0.069),
                      Text(appliedjobs.companyname),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width:  width * 0.05,
                      ),
                      Container(
                        height: height *0.03,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 164, 218, 198),
                        ),
                        child: Center(child: Text('Application Sent '))
                      ),
                      SizedBox(
                       width:  width*0.2,
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.book,size: 20,color: Color.fromARGB(255, 36, 35, 35),))
                      ,Text('Similar',style: TextStyle(color: Color.fromARGB(255, 35, 34, 34)),)
                    ],

                  ),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
