import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';

import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/screen/neweducation.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';
import 'package:jobmingle/utils/validator.dart';

class Introduction extends StatefulWidget {
  final String name;
  final String ? profileheadlines;

  Introduction({super.key, required this.name, this.profileheadlines});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _currentLength = 0;

  final int _maxLength = 35;
  final int _maxLengthHeadline = 250;

  late TextEditingController _fullNameController;
  late TextEditingController _headlineController;

  @override
  void initState() {
    super.initState();
    //context.read<ProfileBloc>().add(GetUserEvent());
    _fullNameController = TextEditingController(text: widget.name);
    _headlineController = TextEditingController(text: "Looking for jobs requiring following skills:");

    _fullNameController.addListener(() {
      setState(() {
        _currentLength = _fullNameController.text.length;
      });
    });

    _headlineController.addListener(() {
      setState(() {
        _currentLength = _headlineController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _headlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Introduction",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 70, 69, 69),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      controller: _fullNameController,
                      validator: (value) => Validator().nameValidator(value),
                      hintText: 'Name',
                      labeltext: 'Full Name *',
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: CustomTextFormField(
                        maxlines: 5,
                        minlines: 10,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        validator: (value) => Validator().nameValidator(value),
                        counterText: '$_currentLength / $_maxLengthHeadline',
                        controller: _headlineController,
                        hintText: 'Profile Headline',
                        labeltext: "Skills",
                      ),
                    ),
                  ),
                  Text("Write a concise headline introducing yourself to employers"),
                  SizedBox(height: 30),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is EducationSucessfuly) {
                        return Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColor.lightblue(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Education",
                                        style: TextStyle(color: CustomColor.graycolor()),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddnewEducation1(),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: CustomColor.bluecolor(),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Higer Education : ${state.education.higereducation!}'),
                                Text('Course :${state.education.course}'),
                                Text('Course Type :${state.education.coursetype}'),
                                Text('Stating Year :${state.education.courseStaringyear}'),
                                Text('Ending Year :${state.education.courseendingyear}'),
                                Text('Grade of the Course :${state.education.grade}'),
                                Text('University Name/College Name : ${state.education.universitynamecollegename}')
                              ],
                            ),
                          ),
                        );
                      } else if (state is ProfileInitial) {
                        return Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColor.lightblue(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Education",
                                  style: TextStyle(color: CustomColor.graycolor()),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddnewEducation1(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: CustomColor.bluecolor(),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is ProfileFailer) {
                        return Text('Failed to load education data');
                      } else {
                        return Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColor.lightblue(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Education",
                                  style: TextStyle(color: CustomColor.graycolor()),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddnewEducation1(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: CustomColor.bluecolor(),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final userintro = Usermodel(
                              name: _fullNameController.text,
                              profileheadlines: _headlineController.text,
                            );
                            context.read<ProfileBloc>().add(UpdateIntroducation(
                                profileheadlines: userintro.profileheadlines!,
                                username: userintro.name!));
                                 
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(' Profile Successfully Updated '),
                                backgroundColor: Colors.green,
                              ));
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                  context.read<ProfileBloc>().add(GetUserEvent());
                                });

                              });
                            });
                          }
                        },
                        child: Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
