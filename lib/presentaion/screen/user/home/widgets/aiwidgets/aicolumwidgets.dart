import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:jobmingle/utils/customtext/customtext.dart';
import 'package:lottie/lottie.dart';

class AIcolum extends StatelessWidget {
  const AIcolum({
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
        Row(
          children: [
            Text(
              "Find Jobs",
              style: TextStyle(
                color: CustomColor.bluecolor(),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Spacer(),
            FaIcon(
              Icons.area_chart_sharp,
              color: CustomColor.bluecolor(),
              size: 24,
            ),
          ],
        ),
        SizedBox(height: 8),
        CustomText(
          text: 'Chat With AI',
          fontSize: 20,
          color: Colors.white, // Updated to white for contrast
        ),
        SizedBox(height: 8),
        Center(
          child: Container(
            height: height * 0.07,
            child: LottieBuilder.asset(
              'lib/assests/images/aianimation.json',
            ),
          ),
        ),
      ],
    );
  }
}
