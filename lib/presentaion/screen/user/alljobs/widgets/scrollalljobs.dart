import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/jobdetails.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScrollinghomeAllJob extends StatefulWidget {
  const ScrollinghomeAllJob({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<ScrollinghomeAllJob> createState() => _ScrollinghomeAllJobState();
}

class _ScrollinghomeAllJobState extends State<ScrollinghomeAllJob> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllJobsBloc, GetAllJobsState>(
      builder: (context, state) {
        if (state is JobLoadingState) {
          return Center(
              child: LoadingAnimationWidget.stretchedDots(
                  color: CustomColor.bluelight(), size: 90));
        } else if (state is JobLoaded) {
          final jobs = state.jobs;

          if (jobs.isEmpty) {
            return Center(
              child: Text('No jobs found.'),
            );
          }
          return SizedBox(
            child: ListView.builder(
              padding: EdgeInsets.only(),
              itemCount: jobs.length,
              itemBuilder: (BuildContext context, int index) {
                final JobModel job = jobs[index];
                return Jobdetails(
                    job: job, height: widget.height, width: widget.width);
              },
            ),
          );
        } else if (state is PostErrorState) {
          return Center(
            child: Text('Failed to load jobs.'),
          );
        }
        return Center(
          child: Text(''),
        );
      },
    );
  }
}
