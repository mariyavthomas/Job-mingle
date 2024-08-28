import 'package:flutter/material.dart';

class CustomappBar extends StatelessWidget {
  const CustomappBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme:
          IconThemeData(color: Colors.black), // Set icon color to black
      backgroundColor: Colors.white,
      title: Text(
        "Settings",
        style: TextStyle(fontSize: 25, color: Colors.black),
      ),
    );
  }
}
