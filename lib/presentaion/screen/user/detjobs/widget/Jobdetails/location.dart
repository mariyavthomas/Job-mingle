import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.widget,
    required this.width,
    
  });

  
  final double width;
  final DetailsJob widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: CustomColor.graycolor(),
          size: 30,
        ),
        Column(
          children: [
            Text(
              "Location",
              style: TextStyle(
                  color: CustomColor.graycolor(),
                  fontWeight: FontWeight.bold),
            ),
            Text('${widget.job.city}')
          ],
        ),
        SizedBox(
          width: width * 0.25,
        ),
        Icon(
          Icons.star_half,
          color: CustomColor.graycolor(),
          size: 30,
        ),
        Column(
          children: [
            Text(
              "Experience",
              style: TextStyle(
                  color: CustomColor.graycolor(),
                  fontWeight: FontWeight.bold),
            ),
            Text('${widget.job.experience}')
          ],
        ),
      ],
    );
  }
}

