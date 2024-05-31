import 'package:border_bottom_navigation_bar/border_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/applies/applies_screen.dart';
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

  int _currentIndex = 0;
  List tabtarget = [
    HomePage(),
    AppliesScreen(),
    ProfilePage(),
  ];

  List<String> _appTitles = ['jjj', 'Profile', 'Settings'];
  int _apptilecurrent = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 219, 221, 230),
            iconTheme: IconThemeData(color: Colors.grey),
           
            ),
        drawer: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
          child: Drawer(
              
            elevation: 20,
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is UserProfileLoaedState) {
                  return ListView(children: [
                    Column(children: [
                     

                     
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  maxRadius: 40,
                                  backgroundColor: CustomColor.graycolor(),
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: CustomColor.graycolor(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          state.user.name.toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 18),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                            },
                                            child: Text(
                                              'Update profile',
                                              style: TextStyle(
                                                  color:
                                                      CustomColor.bluecolor()),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    )),
                              ]),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 2,
                        ),
                      )
                    ]),
                  ]);
                }
                return Center();
              },
            ),
            clipBehavior: Clip.hardEdge,
          ),
        ),
        bottomNavigationBar: BorderBottomNavigationBar(
          height: 53,
          
          currentIndex: _currentIndex,
          borderRadiusValue: 25,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _apptilecurrent = index;
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
