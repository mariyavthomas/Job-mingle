import 'package:flutter/material.dart';
import 'package:jobmingle/utils/customcolor.dart';

class ContactPerson extends StatelessWidget {
  const ContactPerson({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.call,
          color: CustomColor.graycolor(),
        ),
        SizedBox(
          width: width * 0.01,
        ),
        Text(
          " Contact Person",
          style: TextStyle(color: CustomColor.graycolor()),
        )
      ],
    );
  }
}

