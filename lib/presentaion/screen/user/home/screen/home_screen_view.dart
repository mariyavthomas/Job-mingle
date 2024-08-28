import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jobmingle/application/favorite/favorite_bloc.dart';
import 'package:jobmingle/application/filter_bloc/filter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/appbar/customappbar.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/body/cutombody.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  final _key = GlobalKey();
  Position? position;
  int favCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetUserEvent());
    context.read<FavoriteBloc>().add(GetfavEvent());
    context.read<FilterBloc>().add(FilterallEvent());
    context.read<GetAllJobsBloc>().add(FetchJobs());
    //_getFavCount();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: CutomDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: Cutomappbar(height: height, favCount: favCount),
        ),
        body: CustomBody(height: height, width: width),
      ),
    );
  }
}
