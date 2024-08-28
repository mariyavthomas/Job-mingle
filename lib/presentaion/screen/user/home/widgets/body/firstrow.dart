import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/Screen/all_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Firstrowalljobs extends StatelessWidget {
  const Firstrowalljobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Job Based on Your Profile',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Spacer(),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllJobs(),
                    ));
              },
              child: Text(
                "See More",
                style: TextStyle(color: CustomColor.bluecolor()),
              ))
        ],
      ),
    );
  }
}
