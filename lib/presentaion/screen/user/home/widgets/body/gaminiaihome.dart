import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/chatai/screen/chat_screen.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/aiwidgets/aicolumwidgets.dart';

class GaminiAihome extends StatelessWidget {
  const GaminiAihome({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GeminiFriend()));
      },
      child: Center(
        child: Container(
          height: height * 0.16,
          width: width * 0.9,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assests/images/aiaii.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), // Darkens the image for better text contrast
                BlendMode.dstATop,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AIcolum(height: height),
          ),
        ),
      ),
    );
  }
}
