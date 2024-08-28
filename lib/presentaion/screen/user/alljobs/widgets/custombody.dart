import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/allJob.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/title.dart';

class Cutombodyalljobs extends StatelessWidget {
  const Cutombodyalljobs({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleColum(height: height),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                'Jobs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              BlocBuilder<GetAllJobsBloc, GetAllJobsState>(
                builder: (context, state) {
                  if (state is JobLoaded) {
                    return Text(
                      '${state.jobs.length} Jobs Available',
                      style: TextStyle(color: Colors.grey),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: AllJob(
            // job: state.jobs[index],
            width: width,
            height: height,
          ),
        )
      ],
    );
  }
}
