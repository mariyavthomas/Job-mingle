import 'package:flutter/material.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.043,
      width: width * 0.3,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius:
              BorderRadius.all(Radius.circular(5))),
      child: Center(
          child: Text(
        "Report Job",
        style: TextStyle(color: Colors.red),
      )),
    );
  }
}

