import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Company/company_listview.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/jobdetails.dart';
import 'package:jobmingle/utils/customcolor.dart';


// ignore: must_be_immutable
class DetailsJob extends StatefulWidget {
  DetailsJob({super.key, required this.job});

  JobModel job;

  @override
  State<DetailsJob> createState() => _DetailsJobState();
}

class _DetailsJobState extends State<DetailsJob> {
   User? _currentuser;
   late Map<String, dynamic> _userData;

  @override
  void initState() {
    super.initState();
    _currentuser = FirebaseAuth.instance.currentUser;
    _fetchUserData();
    context.read<ProfileBloc>().add(GetUserEvent());
   // _userData;
  }

  Future<void> _fetchUserData() async {
    if (_currentuser != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(_currentuser!.uid)
            .get();

        setState(() {
          _userData = (userDoc.data() as Map<String, dynamic>?) ??
              {}; // Extract user data from document
        });
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("mariya");
    print(_currentuser?.displayName);
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.job.companyname),
          backgroundColor: CustomColor.bluecolor(),
          bottom: TabBar(
            tabs: [
              Tab(text: 'JOB DETAILS'),
              Tab(text: 'COMPANY DETAILS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllJobdetails(
                height: height,
                width: width,
                widget: widget,
                currentuser: _currentuser,
                userData: _userData),
            CompanyListView(height: height, widget: widget)
          ],
        ),
      ),
    );
  }
}
