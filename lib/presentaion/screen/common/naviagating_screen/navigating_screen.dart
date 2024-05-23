import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/common/naviagating_screen/naviagating_widgets.dart';

class NaviagtingScreen extends StatelessWidget {
  NaviagtingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assests/images/firstpage.jpg'),
        fit: BoxFit.cover
        )),
        child: Center(
          child: Custom_container_widget()),
      ),
    
    );
  }
}
