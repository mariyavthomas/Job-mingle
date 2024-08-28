import 'package:flutter/material.dart';

class CutomInwell extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const CutomInwell({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
