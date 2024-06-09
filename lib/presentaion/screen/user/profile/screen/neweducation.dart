import 'package:flutter/material.dart';
import 'package:jobmingle/utils/customcolor.dart';

class AddnewEducation extends StatelessWidget {
  const AddnewEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 275),
                  child: Text("Education",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                
                Text('''Details like course,University,and more,help resuiters identify your educational identify your educational background''',style: TextStyle(color: CustomColor.darkgry()),)
               ,
               SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(right: 310),
                  child: Text("Education *",style: TextStyle(color: CustomColor.darkgry(),fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}