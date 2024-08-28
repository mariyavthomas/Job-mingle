import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/favorite/screen/fav_screen.dart';
import 'package:jobmingle/presentaion/screen/user/chatai/screen/chat_screen.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/drawer/colum.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/drawer/inwell.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/drawer/row.dart';
import 'package:jobmingle/presentaion/screen/user/settings/aboutus/screen/about.dart';
import 'package:jobmingle/presentaion/screen/user/settings/jobmingle_works/screen/works.dart';
import 'package:jobmingle/presentaion/screen/user/settings/settings/screen/setting_screen.dart';

class CutomDrawer extends StatelessWidget {
  const CutomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
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
                  CutomDraweColum(
                    state: state,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(height: 30),
                  CutomInwell(
                      icon: Icon(Icons.save),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavScreen())),
                      text: 'Saved Jobs'),
                  CutomRow(
                    customicon: Icon(Icons.save),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobMingleWorks())),
                    text: 'How JobMingle Works',
                  ),
                  CutomRow(
                    customicon: Icon(Icons.report),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutUsScreen())),
                    text: 'About',
                  ),
                  CutomRow(
                      customicon: Icon(Icons.settings),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen())),
                      text: 'Settings'),
                  CutomInwell(
                      icon: Icon(Icons.chat),
                      text: "Chat With AI",
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeminiFriend()))),
                  SizedBox(height: 200),
                ],
              ),
            ),
          );
        }
        return Text('');
      },
    );
  }}