import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/application/profilef/profilesummert/aboutme_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

class ProfileSummery extends StatefulWidget {
  const ProfileSummery({super.key, required this.profilesummery});

  final String profilesummery;

  @override
  State<ProfileSummery> createState() => _ProfileSummeryState();
}

class _ProfileSummeryState extends State<ProfileSummery> {
  TextEditingController profilesummerycontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    profilesummerycontroller =
        TextEditingController(text: widget.profilesummery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.bluecolor(),
        title: Text("Profile Summery"),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "About Me",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                  maxlines: 10,
                  minlines: 5,
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  controller: profilesummerycontroller,
                  hintText: '',
                  labeltext: ''),
            ),
            Row(
              children: [
                SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Skip")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final aboutme = Usermodel(
                            profilesummery: profilesummerycontroller.text);
                        context.read<AboutmeBloc>().add(ProfileSummeryy(
                            profilesummery: aboutme.profilesummery!));
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(' Profile Successfully Updated '),
                            backgroundColor: Colors.green,
                          ));
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pop(context);
                              context.read<ProfileBloc>().add(GetUserEvent());
                            });
                          });
                        });
                      }
                    },
                    child: Text("Save"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
