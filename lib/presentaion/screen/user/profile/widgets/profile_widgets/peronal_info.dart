import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/personlinfo/personinfo_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/personal_info.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Personal_Info extends StatefulWidget {
  Personal_Info({super.key, required this.user});
  Usermodel user;
  @override
  State<Personal_Info> createState() => _Personal_InfoState();
}

class _Personal_InfoState extends State<Personal_Info> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,borderRadius:BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(Icons.person_2_outlined, color: Colors.grey, size: 27),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                SizedBox(width: 50),
                IconButton(
                  icon: Icon(Icons.edit_square),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInfo(
                                  email: widget.user.email!,
                                  phone: widget.user.phone!,
                                  dob: widget.user.dob!,
                                  gender: widget.user.gender!,
                                  language: widget.user.language!,
                                  address: widget.user.address!,
                                  pincode: widget.user.pincode!,
                                  hometown: widget.user.hometown!,
                                )));
                  },
                  color: CustomColor.bluelight(),
                )
              ]),
             
              SizedBox(
                height: 10,
              ),
              Text(
                "Gender",
                style: TextStyle(color: Colors.grey),
              ),
              Text(widget.user.gender!),
              SizedBox(
                height: 10,
              ),
              Text(
                "Language",
                style: TextStyle(color: Colors.grey),
              ),
              Text(widget.user.language!),
              SizedBox(
                height: 10,
              ),
              Text(
                "Date of Birth",
                style: TextStyle(color: Colors.grey),
              ),
              Text(widget.user.dob!),
              SizedBox(
                height: 10,
              ),
              Text("Address", style: TextStyle(color: Colors.grey)),
              Text(widget.user.address!),
              BlocBuilder<PersoninfoBloc, PersoninfoState>(
                builder: (context, state) {
                  if (state is Personinfosuccess) {
                    return Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ));
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
Future<void> _openPdf(BuildContext context, String pdfUrl) async {
  try {
    if (pdfUrl.isEmpty) {
      throw 'PDF URL is empty';
    }

    final Uri pdfUri = Uri.parse(pdfUrl);

    if (await canLaunchUrl(pdfUri)) {
      await launchUrl(pdfUri);
    } else {
      throw 'Could not launch $pdfUrl';
    }
  } catch (e) {
    print('Error launching PDF: $e');
    // Handle error gracefully, e.g., show a dialog to the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Could not open the PDF: $e'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
