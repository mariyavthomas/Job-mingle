import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/jobdetails.dart';

class ApplyJobs extends StatelessWidget {
  const ApplyJobs({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyjobBloc, ApplyjobState>(
      builder: (context, state) {
        
        if (state is ApplyjobLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AppliedJobLoaded) {
          print("hleo");
          if (state.appliedjob.isEmpty) {
            return Center(
              child: Text('No jobs found.'),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.only(top: 15),
            itemCount: state.appliedjob.length,
            itemBuilder: (BuildContext context, int index) {
              final AppliedJobModel appliedjobs = state.appliedjob[index];
              //print(appliedjobs.username);
              return JobDetailsapply(height: height, appliedjobs: appliedjobs, width: width);
            },
          );
        } else if (state is ApplyjobFailure) {
          return Center(
            child: Text('Failed to load jobs.'),
          );
        }
        return Center(
          child: Text('Unknown state.'),
        );
      },
    );
  }
}

