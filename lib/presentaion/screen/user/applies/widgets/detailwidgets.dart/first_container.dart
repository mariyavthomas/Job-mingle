import 'package:flutter/material.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    super.key,
    required this.statusColor,
    required this.statusIcon,
    required this.status,
  });

  final Color statusColor;
  final IconData statusIcon;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              statusColor.withOpacity(0.2),
              statusColor.withOpacity(0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              statusIcon,
              color: statusColor,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

