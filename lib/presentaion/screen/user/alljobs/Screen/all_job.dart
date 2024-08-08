import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/allJob.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/title.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        body: Column(
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
        ),
      ),
    );
  }
}
