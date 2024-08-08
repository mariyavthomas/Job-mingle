import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/application/favorite/favorite_bloc.dart';
import 'package:jobmingle/application/filter_bloc/filter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/Favorite/screen/fav_screen.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/Screen/all_job.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/allJob.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/jobdetails.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/title.dart';
import 'package:jobmingle/presentaion/screen/user/chat/screen/chat_screen.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    _getFavCount();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoaedState) {
              return Drawer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      state.user.pic != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(state.user.pic!),
                              backgroundColor: Colors.grey,
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: const Color.fromARGB(255, 229, 226, 226),
                                size: 40,
                              ),
                            ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          Text(state.user.name!.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5),
                          Text(state.user.email!,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavScreen()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Saved Jobs",
                                style: TextStyle(
                                  fontSize: 16,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.question_mark_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("How JobMingle Works",
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.report,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("About Us",
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Settings",
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GeminiFriend()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Chat with AI",
                                style: TextStyle(
                                  fontSize: 16,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 200),
                      Row(
                        children: [
                          Text('Sign Out',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              _showLogoutDialog(context);
                            },
                            icon: Icon(Icons.logout),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return Text('');
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: AppBar(
            backgroundColor: CustomColor.bluecolor(),
            title: TitleColum(height: height * 0.03),
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FavScreen(onFavCountChanged: (newCount) {
                                    setState(() {
                                      favCount = newCount;
                                    });
                                  })));
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  if (favCount > 0)
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          favCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Job Based on Your Profile',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllJobs(),
                              ));
                        },
                        child: Text(
                          "See More",
                          style: TextStyle(color: CustomColor.bluecolor()),
                        ))
                  ],
                ),
              ),
              BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FilterSuccessState) {
                    final filter = state.filterjob;
                    if (filter.isEmpty) {
                      return Center(
                          child: AllJob(height: height, width: width));
                    }
                    return Container(
                      height: height * 0.18, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filter.length,
                        itemBuilder: (BuildContext context, int index) {
                          final JobModel job = filter[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsJob(job: job)));
                              },
                              child: Container(
                                height:
                                    height * 0.18, // Adjust height as needed
                                width: width * 0.6,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: CustomColor.bluelight()),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            job.jobtitle,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Text(
                                            "Rs.${job.salary!}",
                                            style: TextStyle(
                                                color: CustomColor.bluecolor()),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 60),
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
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 28),
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
                                                        DetailsJob(job: job)));
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: CustomColor.bluecolor(),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Lottie.asset('lib/assests/images/favemty.json'),
                    );
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GeminiFriend()));
                },
                child: Center(
                  child: Container(
                    height: height * 0.15,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assests/images/aiaii.jpg'),
                            fit: BoxFit.cover,
                            opacity: 100),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Find Jobs",
                                style: TextStyle(
                                    color: CustomColor.bluecolor(),
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              FaIcon(Icons.area_chart_sharp)
                            ],
                          ),
                          Text(
                            "Chat With AI",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomColor.bluecolor(),
                                fontSize: 20),
                          ),
                          Container(
                            height: height * 0.07,
                            child: LottieBuilder.asset(
                                'lib/assests/images/aianimation.json'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<GetAllJobsBloc, GetAllJobsState>(
                builder: (context, state) {
                  if (state is JobLoaded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${state.jobs.length} Jobs Available',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
              BlocBuilder<GetAllJobsBloc, GetAllJobsState>(
                builder: (context, state) {
                  if (state is JobLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is JobLoaded) {
                    final jobs = state.jobs;
                    if (jobs.isEmpty) {
                      return Center(
                        child: Text('No jobs found.'),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      shrinkWrap:
                          true, // Allows ListView to take only required space
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents scrolling if inside another scrollable widget
                      itemCount: jobs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final JobModel job = jobs[index];
                        return Jobdetails(
                            job: job, height: height, width: width);
                      },
                    );
                  } else if (state is PostErrorState) {
                    return Center(
                      child: Text('Failed to load jobs.'),
                    );
                  }
                  return Center(
                    child: Text('Unknown state.'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _performLogout(context); // Perform the logout
              },
            ),
          ],
        );
      },
    );
  }

  void _getFavCount() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("fav")
        .where('useruid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      favCount = querySnapshot.docs.length;
    });
  }

  void _performLogout(BuildContext context) {
    final authBloc = BlocProvider.of<LoginauthBloc>(context);
    authBloc.add(SignOutEvent());

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
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
