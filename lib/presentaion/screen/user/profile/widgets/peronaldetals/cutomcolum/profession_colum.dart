import 'package:flutter/material.dart';

class CutomColum extends StatelessWidget {
  const CutomColum({
    super.key,
    required this.text,
    
    required this.text2
  });

  final String text;
  
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           text,
            style: TextStyle(color: Colors.grey),
          ),
         
          Text(text2),
        ],
      );
  }
}

// ignore: must_be_immutable
