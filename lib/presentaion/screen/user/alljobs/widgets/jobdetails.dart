import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';

class Jobdetails extends StatelessWidget {
  final JobModel job;
  final double height;
  final double width;

  const Jobdetails({
    Key? key,
    required this.job,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         context.read<GetAllJobsBloc>().add(FilterJobsByName(jobtitle:job.jobtitle));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsJob(job: job),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                    child: ClipRRect(
                      child: Image.asset("lib/assests/images/icon.webp"),
                    ),
                  ),
                  title: Text(
                    job.jobtitle,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Rs. ${job.salary ?? ''}',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue.shade900,
                    size: height * 0.04,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on_outlined,
                    size: 26,
                    color: Colors.red,
                  ),
                  title: Text(
                    "${job.country}, ${job.state}, ${job.city}",
                    style: TextStyle(
                      color: Colors.black54,
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
                      SizedBox(
                        width: width * 0.069,
                      ),
                      Text(job.companyname),
                    ],
                  ),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
