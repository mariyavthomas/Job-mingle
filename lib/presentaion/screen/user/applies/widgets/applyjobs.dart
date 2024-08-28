import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/jobdetails.dart';
import 'package:lottie/lottie.dart';

class ApplyJobs extends StatefulWidget {
  const ApplyJobs({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<ApplyJobs> createState() => _ApplyJobsState();
}

class _ApplyJobsState extends State<ApplyJobs> {
  @override
  void initState() {
    super.initState();
    context.read<ApplyjobBloc>().add(LoadAppliedJobs());
  }

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
              child: Container(
                child: Lottie.asset('lib/assests/images/favemty.json'),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.only(top: 15),
            itemCount: state.appliedjob.length,
            itemBuilder: (BuildContext context, int index) {
              final AppliedJobModel appliedjobs = state.appliedjob[index];
              print("heloo :${appliedjobs.candidatestatus}");
              return JobDetailsapply(
                  height: widget.height,
                  appliedjobs: appliedjobs,
                  width: widget.width);
            },
          );
        } else if (state is ApplyjobFailure) {
          return Center(
            child: Container(
                // child: Lottie.asset('lib/assests/images/favemty.json'),
                ),
          );
        }
        return Center(
          child: Text('Unknown state.'),
        );
      },
    );
  }
}
