import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';

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
    return SafeArea(
      child: Scaffold(
        // drawer: Drawer(),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                //fetchpostion();
              },
              icon: Icon(Icons.location_on)),
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
