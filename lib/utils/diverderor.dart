import 'package:flutter/material.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Divideror{
    static Widget rowdivider(){
         return Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
            width: 140,
            child: Divider(
              thickness: 2,
             color: CustomColor.graycolor(),
            ),
                  ),
          ),
        const SizedBox(
          width: 5,
        ),
        Text("or",style: TextStyle(  color: CustomColor.graycolor(),),),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 110,
          child: Divider(
            thickness: 2,
             color: CustomColor.graycolor(),
          ),
        )

         ],);
    }
}