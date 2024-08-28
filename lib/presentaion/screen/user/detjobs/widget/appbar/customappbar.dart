import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/favorite/favorite_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class DetailPageAppbar extends StatelessWidget {
  const DetailPageAppbar({
    super.key,
    required this.widget,
  });

  final DetailsJob widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
       leading:  IconButton(onPressed: (){
          
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
           context.read<FavoriteBloc>().add(GetfavEvent());
           context.read<GetAllJobsBloc>().add(FetchJobs());
           Navigator.pop(context);
          });
          
        }, icon: Icon(Icons.arrow_back)
        ),
      title: Text(widget.job.companyname),
      backgroundColor: CustomColor.bluecolor(),
      bottom: TabBar(
        tabs: [
          Tab(text: 'JOB DETAILS'),
          Tab(text: 'COMPANY DETAILS'),
        ],
        
      ),
    );
  }
}
