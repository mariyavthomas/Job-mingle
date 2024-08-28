import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/body/alljobhome.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/body/countjobs.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/body/filterjobs.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/body/firstrow.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/body/gaminiaihome.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Firstrowalljobs()),
        SliverToBoxAdapter(child: Filterjobs(height: height, width: width)),
        SliverToBoxAdapter(child: SizedBox(height: height * 0.01)),
        SliverToBoxAdapter(child: GaminiAihome(height: height, width: width)),
        SliverToBoxAdapter(child: CountTotalJobs()),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Alljobshome(height: height, width: width);
            },
            childCount: 1, // Adjust this if needed
          ),
        ),
      ],
    );
  }
}
