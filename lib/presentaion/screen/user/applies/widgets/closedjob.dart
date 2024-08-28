import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/filter_bloc/filter_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class SimplarJobs extends StatelessWidget {
  const SimplarJobs({
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
                color: CustomColor.bluelight(), size: 90),
          );
        } else if (state is FilterSuccessState) {
          final filter = state.filterjob;

          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available Jobs", // Custom text
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filter.length,
                    itemBuilder: (BuildContext context, int index) {
                      final JobModel job = filter[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsJob(job: job),
                            ),
                          );
                        },
                        child: Container(
                          height: height * 0.16, // Adjust height as needed
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomColor.bluelight()),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      job.jobtitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 25),
                                    Text(
                                      "Rs.${job.salary!}",
                                      style: TextStyle(
                                          color: CustomColor.bluecolor()),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 60),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Color.fromARGB(
                                                255, 242, 163, 90),
                                            size: 15,
                                          ),
                                          Text(job.city)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 28),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.business,
                                            color: Color.fromARGB(
                                                255, 242, 163, 90),
                                            size: 15,
                                          ),
                                          Text(job.companyname)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsJob(job: job),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: CustomColor.bluecolor(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
