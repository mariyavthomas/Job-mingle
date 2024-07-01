import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/neweducation.dart';

import 'package:jobmingle/utils/customcolor.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';
import 'package:jobmingle/utils/validator.dart';

class Introduction extends StatefulWidget {
  Introduction({super.key, required this.name});
  String name;

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final formkey = GlobalKey<FormState>();

  int _currentLength = 0;

  final int _maxLength = 35;
  final int _maxLengthheadline = 250;

  TextEditingController _fullnamecontroller = TextEditingController();
  TextEditingController _headlineController = TextEditingController();

  // void initState() {
  //   super.initState();
  //   _fullnamecontroller.addListener(() {
  //     setState(() {
  //       _currentLength = _fullnamecontroller.text.length;
  //     });
  //   });
  //   _headlineController.addListener(() {
  //     setState(() {
  //       _currentLength = _headlineController.text.length;
  //     });
  //   });
  // }

  String headline = "Looking for jobs requiring following skills:";

  @override
  Widget build(BuildContext context) {
    _fullnamecontroller.text = widget.name;
    _headlineController.text = headline;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Introduction",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 70, 69, 69)),
                        ),
                      )),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      controller: _fullnamecontroller,
                      validator: (value) => Validator().nameValidator(value),
                      hintText: 'Name',
                      labeltext: 'Full Name *',
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //height: 200,
                      width: 500,
                      child: CustomTextFormField(
                        maxlines: 5,
                        minlines: 10,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        validator: (value) =>
                            Validator().nameValidator(value),
                        counterText: '$_currentLength / $_maxLengthheadline ',
                        controller: _headlineController,
                        hintText: 'ProfileHeadline',
                        labeltext: "Skills",
                      ),
                    ),
                  ),
                  Text(
                      "Write a concise headline introducing yourself to employers"),
                  SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is EducationSucessfuly) {
                        return Container(
                          height: 100,
                          width: 485,
                          decoration: BoxDecoration(
                              color: CustomColor.lightblue(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Education",
                                        style: TextStyle(
                                            color: CustomColor.graycolor()),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddnewEducation1()));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: CustomColor.bluecolor(),
                                        ))
                                  ],
                                ),
                                Text(state.education.grade!)
                              ],
                            ),
                          ),
                        );
                      } else if (state is ProfileInitial) {
                        return Container(
                          height: 50,
                          width: 485,
                          decoration: BoxDecoration(
                              color: CustomColor.lightblue(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Education",
                                      style: TextStyle(
                                          color: CustomColor.graycolor()),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddnewEducation1()));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: CustomColor.bluecolor(),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (state is ProfileFailer) {
                        return Text('Failed to load education data');
                      } else {
                        return Container(
                          height: 50,
                          width: 485,
                          decoration: BoxDecoration(
                              color: CustomColor.lightblue(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Education",
                                      style: TextStyle(
                                          color: CustomColor.graycolor()),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddnewEducation1()));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: CustomColor.bluecolor(),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: TextButton(onPressed: (){

                  //   }, child: Text("Add new",style: TextStyle(color: CustomColor.bluecolor()),)))
                  // ,
                  SizedBox(
                    height: 180,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel")),
                      ElevatedButton(onPressed: () {}, child: Text("Save"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
