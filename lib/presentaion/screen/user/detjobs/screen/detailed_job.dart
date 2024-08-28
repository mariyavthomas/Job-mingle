import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Company/company_listview.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/Jobdetails/jobdetails.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/widget/appbar/customappbar.dart';

// ignore: must_be_immutable
class DetailsJob extends StatefulWidget {
  DetailsJob({super.key, required this.job, this.isFavorited});

  final JobModel job;
  bool? isFavorited;
  @override
  State<DetailsJob> createState() => _DetailsJobState();
}

class _DetailsJobState extends State<DetailsJob> {
  User? _currentUser;
  late Future<Map<String, dynamic>> _userDataFuture;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
    _userDataFuture = _fetchUserData();
    context.read<ProfileBloc>().add(GetUserEvent());
  }

  Future<Map<String, dynamic>> _fetchUserData() async {
    if (_currentUser != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(_currentUser!.uid)
            .get();

        return userDoc.data() as Map<String, dynamic>? ?? {};
      } catch (e) {
        print('Error fetching user data: $e');
        return {};
      }
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2, // Adjusted to match the number of tabs
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(10, 50),
            child: DetailPageAppbar(widget: widget)),
        body: FutureBuilder<Map<String, dynamic>>(
          future: _userDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading user data'));
            } else {
              final userData = snapshot.data ?? {};
              return TabBarView(
                children: [
                  AllJobdetails(
                    height: height,
                    width: width,
                    widget: widget,
                    currentuser: _currentUser,
                    userData: userData,
                    isFavorited: widget.isFavorited,
                  ),
                  CompanyListView(height: height, widget: widget),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
