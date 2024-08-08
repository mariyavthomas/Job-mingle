import 'package:flutter/material.dart';

class ClosedJobs extends StatefulWidget {
  const ClosedJobs({super.key});

  @override
  State<ClosedJobs> createState() => _ClosedJobsState();
}

class _ClosedJobsState extends State<ClosedJobs> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 body: Center(child: Text("Closed Job")),
    );
  }
}