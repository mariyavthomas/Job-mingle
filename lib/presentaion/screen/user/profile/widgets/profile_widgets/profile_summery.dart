// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profilesummert/aboutme_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/addprofile_summert.dart';
import 'package:jobmingle/utils/customcolor.dart';

// ignore: must_be_immutable
class Profile_summery extends StatefulWidget {
  Profile_summery({super.key, required this.user});
  Usermodel user;

  @override
  State<Profile_summery> createState() => _Profile_summeryState();
}

class _Profile_summeryState extends State<Profile_summery> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.summarize,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Profile Summary",
                  style: TextStyle(fontSize: 18),
                ),
                //https://chatgpt.com/c/8de65960-e59a-4c24-9101-4620b2298dc0
                SizedBox(width: 100),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileSummery(
                                  profilesummery:
                                      widget.user.profilesummery ?? '')));
                    },
                    icon: Icon(
                      Icons.edit_square,
                      color: CustomColor.bluelight(),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.user.profilesummery ?? 'No profile summary available',
                style: TextStyle(fontSize: 16),
              ),
            ),
            BlocBuilder<AboutmeBloc, AboutmeState>(
              builder: (context, state) {
                if (state is AboutLoading) {
                  return CircularProgressIndicator();
                } else if (state is AboutmeSuccess) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.profilesummery?.profilesummery ??
                        'No profile summary available'),
                  );
                } else if (state is AboutaddFailer) {
                  return Text('Failed to load profile: ${state.error}');
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
