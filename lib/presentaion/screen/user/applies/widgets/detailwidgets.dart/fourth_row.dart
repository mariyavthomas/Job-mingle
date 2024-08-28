import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/details_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class FourthRow extends StatelessWidget {
  const FourthRow({
    super.key,
    required this.width,
    required this.widget,
  });

  final double width;
  final ScreenApplyDetailsjob widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: width * 0.05),
        Icon(
          Icons.alarm,
          color: CustomColor.bluecolor(),
          size: 27,
        ),
        SizedBox(width: width * 0.06),
        Text("${widget.job.experiencecomp} Experience"),
      ],
    );
  }
}

