import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';

import 'package:jobmingle/domin/models/jobmodel.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text('All Jobs',style: TextStyle(color: Colors.black),)),
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
              return ListView.builder(
                padding: EdgeInsets.only(),
                itemCount: state.jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  final JobModel job = state.jobs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 211, 222, 233),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.jobtitle.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Experience: 0-${job.experience} ',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Location: ${job.city}',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Skills: ${job.skill}',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
