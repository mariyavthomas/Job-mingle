import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';

import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class AllJobs extends StatefulWidget {
  const AllJobs({super.key});

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllJobsBloc>().add(FetchJobs());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(height * 0.08), // Set the height of the AppBar
          child: AppBar(
            backgroundColor: CustomColor.bluecolor(),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.045,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: height * 0.008, vertical: height * 0.008),
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                    onSubmitted: (query) {
                      // Handle the search query here
                      print('Search query: $query');
                    },
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.notifications_active)),
            ],
          ),
        ),
        body: BlocBuilder<GetAllJobsBloc, GetAllJobsState>(
          builder: (context, state) {
            if (state is JobLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is JobLoaded) {
              if (state.jobs.isEmpty) {
                return Center(
                  child: Text('No jobs found.'),
                );
              }
              return Container(
                child: ListView.builder(
                  padding: EdgeInsets.only(),
                  itemCount: state.jobs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final JobModel job = state.jobs[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsJob(job: job,)));
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
                                        color: const Color.fromARGB(
                                            255, 237, 231, 231),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      child: Image.asset(
                                          "lib/assests/images/icon.webp"),
                                    ),
                                  ),
                                  title: Text(
                                    job.jobtitle.toUpperCase(),
                                    style: TextStyle(
                                        color: CustomColor.bluecolor(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Rs.${job.salary!}',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
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
                                        fontWeight: FontWeight.bold),
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
                                      Text(job.companyname)
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is PostErrorState) {
              return Center(
                child: Text('Failed to load jobs.'),
              );
            }
            return Center(
              child: Text('Unknown state.'),
            );
          },
        ),
      ),
    );
  }
}
