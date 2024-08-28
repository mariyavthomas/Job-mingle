import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/chatai/screen/chat_screen.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/Screen/all_job.dart';
import 'package:jobmingle/presentaion/screen/user/applies/screen/applies_screen.dart';
import 'package:jobmingle/presentaion/screen/user/home/screen/home_screen_view.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/profilemain.dart';

List<FlashyTabBarItem> bottomNavItems = <FlashyTabBarItem>[
  FlashyTabBarItem(
    icon: const Icon(Icons.home),
    title: const Text('Home'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.shop),
    title: const Text('All Jobs'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.history_toggle_off),
    title: const Text('My Activity'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.chat),
    title: const Text(' AI Chat'),
  ),
  FlashyTabBarItem(
    icon: const Icon(Icons.person_3_outlined),
    title: const Text('Profile'),
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  HomePage(),
  AllJobs(),
  AppliesScreen(),
  GeminiFriend(),
  ProfilePage(),
];

class MyBottom extends StatelessWidget {
  const MyBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomNavScreen.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: FlashyTabBar(
            height: 70,
            animationCurve: Curves.linear,
            selectedIndex: state.tabIndex,
            showElevation: true,
            onItemSelected: (index) {
              BlocProvider.of<BottomNavigationBarBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
            items: bottomNavItems,
          ),
        );
      },
    );
  }
}
