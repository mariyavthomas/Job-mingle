import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';

class Skills extends StatelessWidget {
  const Skills({
    super.key,
    required this.height,
    required this.widget,
  });

  final double height;
  final DetailsJob widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 198, 196, 196),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Must Have skills"),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              widget.job.skill,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    ));
  }
}

