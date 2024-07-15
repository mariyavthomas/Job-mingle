import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Jobdetails extends StatelessWidget {
  const Jobdetails({
    super.key,
    required this.job,
    required this.height,
    required this.width,
  });

  final JobModel job;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {
           context.read<GetAllJobsBloc>().add(FilterJobsByName(jobtitle:job.jobtitle));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsJob(job: job),
            ),
          ).then((_) {
            context.read<GetAllJobsBloc>().add(FetchJobs());
          });
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
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
                    job.jobtitle.toUpperCase(),
                    style: TextStyle(
                      color: CustomColor.bluecolor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Rs.${job.salary!}',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: CustomColor.bluecolor(),
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
                    "${job.country},${job.state},${job.city}",
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
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
