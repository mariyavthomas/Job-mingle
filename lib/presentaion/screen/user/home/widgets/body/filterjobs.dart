import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/filter_bloc/filter_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/filterwidget/filtercontainer.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class Filterjobs extends StatelessWidget {
  const Filterjobs({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return Center(
              child: LoadingAnimationWidget.stretchedDots(
                  color: CustomColor.bluelight(), size: 90));
        } else if (state is FilterSuccessState) {
          final filter = state.filterjob;
          if (filter.isEmpty) {
            return Center(child: Text(''));
          }
          return Container(
            height: height * 0.18, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (BuildContext context, int index) {
                final JobModel job = filter[index];
                return Filtercontainer(job: job, height: height, width: width);
              },
            ),
          );
        } else {
          return Center(
            child: Lottie.asset('lib/assests/images/favemty.json'),
          );
        }
      },
    );
  }
}
