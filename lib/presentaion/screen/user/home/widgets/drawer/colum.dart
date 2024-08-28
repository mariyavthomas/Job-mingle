import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/allJob.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/title.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class CutomDraweColum extends StatelessWidget {
  CutomDraweColum({
    super.key,
    required this.state,
  });
  UserProfileLoaedState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(state.user.name!.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 5),
        Text(state.user.email!,
            style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

Widget verticallist(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
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
                if (state is JobLoadingState) {
                  return Center(
                      child: LoadingAnimationWidget.stretchedDots(
                          color: CustomColor.bluelight(), size: 90));
                }
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
          width: width,
          height: height,
        ),
      )
    ],
  );
}
