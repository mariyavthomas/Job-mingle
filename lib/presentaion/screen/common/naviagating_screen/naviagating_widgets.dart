import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/onboarding/onboarding.dart';
import 'package:jobmingle/utils/container.dart';

class Custom_container_widget extends StatelessWidget {
  const Custom_container_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(
          height: 90,
          width: 250,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding(select: true,)));
          },
          decoration: BoxDecoration(
              color: Color.fromARGB(200, 75, 110, 225),
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)),
          title: 'Hiring to Work',
          colors: Colors.white,
          fontSize: 20,
        ),
        SizedBox(
          height: 40,
        ),
        CustomContainer(
          height: 90,
          width: 250,
          onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding(select: false)));
          },
          decoration: BoxDecoration(
              color: Color.fromARGB(200, 75, 110, 225),
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)),
          title: 'Open to Work',
          colors: Colors.white,
          fontSize: 20,
        ),
      ],
    );
  }
}
