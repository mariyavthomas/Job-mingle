import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Salary extends StatelessWidget {
  const Salary({
    super.key,
    required this.widget,
    required this.height,
    // required this.widget,
  });

  final DetailsJob widget;
  final double height;
  //final DetailsJob widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(
          '₹ ${widget.job.salary}',
          style: TextStyle(
              color: CustomColor.bluecolor(),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        title: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)),
          height: height * 0.025,
          child: Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Text(
              '${widget.job.numberofopening}openings',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined)));
  }
}
