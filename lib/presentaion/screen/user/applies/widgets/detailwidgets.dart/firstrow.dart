import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmingle/utils/customcolor.dart';
class Firstrow extends StatelessWidget {
  const Firstrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: CustomColor.bluecolor(),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              Icons.share,
              color: CustomColor.bluecolor(),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
