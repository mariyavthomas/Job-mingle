import 'package:flutter/material.dart';
import 'package:jobmingle/utils/customcolor.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color: CustomColor.graycolor(),)),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Profile picture',style: TextStyle(color: CustomColor.blckcolor(),fontWeight: FontWeight.bold,fontSize: 25),),
        
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(""" Profile with photo has 40% hiher chance of gettong noticed by recruiters""",style: TextStyle(color: CustomColor.graycolor(),fontSize: 15),),
            )
          ],),
        ),
      ));
  }
}