// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  String? title;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  BoxDecoration? decoration;
  final double height;
  final double width;
   final colors;
   
   final double ? fontSize;

  CustomContainer({
    this.title,
    this.onTap,
    this.padding,
    this.margin,
    this.decoration,
    this.colors,
   
    this.fontSize,
    required this.height,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        padding: padding,
        margin: margin,
        child: Center(child: Text(title!,style: TextStyle(color: colors,fontWeight: FontWeight.bold,fontSize: fontSize),)),
      ),
    );
  }
}
