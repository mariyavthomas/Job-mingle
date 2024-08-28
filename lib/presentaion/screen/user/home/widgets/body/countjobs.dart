import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';

class CountTotalJobs extends StatelessWidget {
  const CountTotalJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllJobsBloc, GetAllJobsState>(
      builder: (context, state) {
        if (state is JobLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${state.jobs.length} Jobs Available',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}

