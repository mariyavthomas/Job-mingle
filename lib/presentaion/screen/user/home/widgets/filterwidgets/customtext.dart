import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';

// ignore: must_be_immutable
class Filtetext extends StatelessWidget {
  Filtetext({
    super.key,
    required this.job,
    required this.text,
    required this.fontSize,
    this.fontWeight,
    this.color,
  });

  final JobModel job;
  String text;
  double fontSize;
  final FontWeight? fontWeight;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
