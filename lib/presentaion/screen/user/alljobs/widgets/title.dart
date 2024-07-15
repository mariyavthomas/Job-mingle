import 'package:flutter/material.dart';

class TitleColum extends StatelessWidget {
  const TitleColum({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          height: height * 0.045,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: height * 0.008, vertical: height * 0.008),
              suffixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            onSubmitted: (query) {
        
            },
          ),
        ),
      ],
    );
  }
}

