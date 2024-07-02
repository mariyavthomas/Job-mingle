import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/utils/customcolor.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey();
  Position? position;
  // fetchpostion() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   String latitude;
  //   String longitude;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     Fluttertoast.showToast(msg: 'Location Service is disabled');
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       Fluttertoast.showToast(msg: "You denied the permission");
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     Fluttertoast.showToast(msg: "You denied the permission Forever");
  //   }
  //   Position currentpostion = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     position = currentpostion;
  //     latitude =currentpostion.latitude.toString();
  //     print(latitude);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
     // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
         drawer: Drawer(),
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: AppBar(
          backgroundColor: CustomColor.bluecolor(),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.045,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: height * 0.008,
                      vertical: height * 0.008,
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                  onSubmitted: (query) {
                    // Handle the search query here
                    print('Search query: $query');
                  },
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
          ],
        ),
      ),
        body: Center(
          child: Container(
            child: IconButton(
                onPressed: () {
                  final authBloc = BlocProvider.of<LoginauthBloc>(context);
                  authBloc.add(SignOutEvent());

                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                icon: Icon(Icons.logout)),
          ),
        ),
      ),
    );
  }
}
