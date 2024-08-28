// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';

class FilterCutomRow extends StatelessWidget {
  FilterCutomRow({
    super.key,
    required this.job,
    this.icon,
    this.text,
    this.color,
    this.fontSize
  });

  final JobModel job;
  final IconData? icon;
  final String? text; // Changed to String? for better usability
  final Color ? color;
  final double ? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28),
      child: Row(
        children: [
          Icon(
            icon,
            color:color,
            size: fontSize,
          ),
          Text(
            text!,
            
          ),
        ],
      ),
    );
  }
}
