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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08), // Set the height of the AppBar
          child: AppBar(
            backgroundColor: CustomColor.bluecolor(),
            title: TitleColum(height: height),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
            ],
          ),
        ),
        body: AllJob(height: height, width: width),
      ),
    );
  }
}

