import 'package:border_bottom_navigation_bar/border_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/applies/applies_screen.dart';
import 'package:jobmingle/presentaion/screen/user/bottamnaviationbar/widgets/drawer.dart';
import 'package:jobmingle/presentaion/screen/user/home/home_screen_view.dart';
import 'package:jobmingle/presentaion/screen/user/profile/profile.dart';
import 'package:jobmingle/utils/customcolor.dart';

class BottamNavigation extends StatefulWidget {
  const BottamNavigation({super.key});

  @override
  State<BottamNavigation> createState() => _BottamNavigationState();
}

class _BottamNavigationState extends State<BottamNavigation> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetUserEvent());
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
 void _onDeaweitemtapped(int index){
  Navigator.pop(context);
  _onItemTapped(index);
 }
  int _currentIndex = 0;
  List tabtarget = [
    HomePage(),
    AppliesScreen(),
    ProfilePage(),
  ];

  //List<String> _appTitles = ['jjj', 'Settings', 'Profile',"Profile"];
 // int _apptilecurrent = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor:Colors.white,
        //     iconTheme: IconThemeData(color: Colors.grey),
        //   //  title: Center(child: Text(_appTitles.elementAt(_apptilecurrent),style: TextStyle(color: Colors.black),)),
        //     ),
        drawer: drawer(),
        bottomNavigationBar: BorderBottomNavigationBar(
          height: 53,
          
          currentIndex: _currentIndex,
          borderRadiusValue: 25,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
             // _apptilecurrent = index;
            });
            print(index);
          },
          selectedLabelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          selectedBackgroundColor: Colors.blue[900]!,
          unselectedBackgroundColor: CustomColor.bluelight(),
          unselectedIconColor: Colors.grey[600]!,
          selectedIconColor: Colors.white,
          customBottomNavItems: [
            BorderBottomNavigationItems(
              icon: Icons.home,
            ),
            BorderBottomNavigationItems(
              icon: Icons.near_me,
            ),
            BorderBottomNavigationItems(
              icon: Icons.person,
            ),
            BorderBottomNavigationItems(
              icon: Icons.more_horiz,
            ),
            BorderBottomNavigationItems(
              icon: Icons.person,
            ),
          ],
        ),
        body: Center(
          child: tabtarget.elementAt(_currentIndex),
        ),
      ),
    );
  }

}