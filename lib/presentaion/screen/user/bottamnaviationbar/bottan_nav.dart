import 'package:border_bottom_navigation_bar/border_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/home/home_screen_view.dart';

class BottamNavigation extends StatefulWidget {
  const BottamNavigation({super.key});

  @override
  State<BottamNavigation> createState() => _BottamNavigationState();
}

class _BottamNavigationState extends State<BottamNavigation> {
  int _currentIndex=0;
  List tabtarget=[
    HomePage(),
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           bottomNavigationBar: BorderBottomNavigationBar(
                        height: 53,
                        currentIndex: _currentIndex,
                        borderRadiusValue: 25,
                        onTap: (index) {
                        setState(() {
                            _currentIndex = index;
                        });
                        print(index);
                        },
                        selectedLabelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        selectedBackgroundColor: Colors.blue[900]!,
                        unselectedBackgroundColor: Colors.grey[200]!,
                        unselectedIconColor: Colors.grey[600]!,
                        selectedIconColor: Colors.white,
                        customBottomNavItems: [
                        BorderBottomNavigationItems(
                            icon: Icons.home,
                        ),
                        BorderBottomNavigationItems(
                            icon: Icons.event_note_outlined,
                        ),
                        BorderBottomNavigationItems(
                            icon: Icons.add_circle_outline_outlined,
                        ),
                        BorderBottomNavigationItems(
                            icon: Icons.rss_feed_outlined,
                        ),
                        BorderBottomNavigationItems(
                            icon: Icons.more_horiz,
                        ),
                        ],
                    ),
                    body: Center(child: tabtarget.elementAt(_currentIndex),),
         );
  }
}