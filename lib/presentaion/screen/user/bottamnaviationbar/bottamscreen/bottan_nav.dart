import 'package:border_bottom_navigation_bar/border_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/Screen/all_job.dart';
import 'package:jobmingle/presentaion/screen/user/applies/screen/applies_screen.dart';
import 'package:jobmingle/presentaion/screen/user/bottamnaviationbar/widgets/drawer.dart';
import 'package:jobmingle/presentaion/screen/user/chat/screen/chat_screen.dart';
import 'package:jobmingle/presentaion/screen/user/home/screen/home_screen_view.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/profile.dart';
import 'package:jobmingle/utils/customcolor.dart';

class BottamNavigation extends StatefulWidget {
  const BottamNavigation({super.key});

  @override
  State<BottamNavigation> createState() => _BottamNavigationState();
}

class _BottamNavigationState extends State<BottamNavigation> {
  @override
  void initState() {
    super.initState();
    // Access ProfileBloc correctly
    Future.microtask(() {
      context.read<ProfileBloc>().add(GetUserEvent());
    });
  }

  int _currentIndex = 0;
  List tabtarget = [
    HomePage(),
    AppliesScreen(),
    ProfilePage(),
    AllJobs(),
    ChatScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //drawer: drawer(),
        bottomNavigationBar: BorderBottomNavigationBar(
          height: 53,
          currentIndex: _currentIndex,
          borderRadiusValue: 25,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedLabelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          selectedBackgroundColor: Colors.blue[900]!,
          unselectedBackgroundColor: CustomColor.bluelight(),
          unselectedIconColor: Colors.grey[600]!,
          selectedIconColor: Colors.white,
          customBottomNavItems: [
            BorderBottomNavigationItems(icon: Icons.home),
            BorderBottomNavigationItems(icon: Icons.near_me),
            BorderBottomNavigationItems(icon: Icons.person),
            BorderBottomNavigationItems(icon: Icons.shopping_bag),
            BorderBottomNavigationItems(icon: Icons.chat),
          ],
        ),
        body: Center(
          child: tabtarget.elementAt(_currentIndex),
        ),
      ),
    );
  }
}
