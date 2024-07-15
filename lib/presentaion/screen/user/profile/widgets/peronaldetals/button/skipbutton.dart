import 'package:flutter/material.dart';
import 'package:jobmingle/utils/customcolor.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              CustomColor.bluecolor())),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Skip"),
    );
  }
}

