import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/applyjobs.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/closedjob.dart';
import 'package:jobmingle/utils/customcolor.dart';

class AppliesScreen extends StatefulWidget {
  const AppliesScreen({super.key});

  @override
  State<AppliesScreen> createState() => _AppliesScreenState();
}

class _AppliesScreenState extends State<AppliesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApplyjobBloc>().add(LoadAppliedJobs());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor:CustomColor.bluecolor(),
                pinned: true,
                floating: true,
                expandedHeight: 170.0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 9, bottom: 60),
                  title: Text(
                    '''Showing 
My Activity''',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Applications"),
                    Tab(text: "Closed Jobs"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
             
              ApplyJobs(height: height, width: width),
               ClosedJobs(),
              
            ],
          ),
        ),
      ),
    );
  }

  


  
}