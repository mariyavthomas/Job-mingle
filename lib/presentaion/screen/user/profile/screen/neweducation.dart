import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';
import 'package:jobmingle/utils/validator.dart';

class AddnewEducation1 extends StatefulWidget {
  const AddnewEducation1({super.key});

  @override
  State<AddnewEducation1> createState() => _AddnewEducationState();
}

TextEditingController higereducationcontroller = TextEditingController();
TextEditingController universityinstitutenamecontroller =
    TextEditingController();
TextEditingController coursecontroller = TextEditingController();
TextEditingController specializationcontroller = TextEditingController();
TextEditingController coursetypecontroller = TextEditingController();
TextEditingController coursestartingcontroller = TextEditingController();
TextEditingController courseendingcontroller = TextEditingController();
TextEditingController gradingsystemcontroller = TextEditingController();
final formkey = GlobalKey<FormState>();
List<String> education = [
  'Doctorate',
  'Post Graduate',
  'Graduate',
  'ClassXII',
  'Class X'
];
List<String> coursetype = [
  'Full Time',
  'Part Time',
  'Correspondence/Distance Learning'
];
String? selectcoursetype;
String? selectvalueducation;

class _AddnewEducationState extends State<AddnewEducation1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 225),
                    child: Text(
                      "Education",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '''Details like course,University,and more,help resuiters identify your educational identify your educational background''',
                    style: TextStyle(color: CustomColor.darkgry()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260),
                    child: Text(
                      "Education *",
                      style: TextStyle(
                          color: CustomColor.darkgry(),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validator().educationlevel(value),
                      decoration: InputDecoration(
                        labelText: 'Select Education Level',
                      ),
                      value: selectvalueducation,
                      items: education.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (newvale) {
                        setState(() {
                          selectvalueducation = newvale;
                          higereducationcontroller.text = selectvalueducation!;
                        });
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: universityinstitutenamecontroller,
                    hintText: "",
                    labeltext: 'University / Institute name *',
                    validator: (value) => Validator().universityname(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: coursecontroller,
                    hintText: '',
                    labeltext: 'Course *',
                    validator: (value) => Validator().course(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: specializationcontroller,
                    hintText: '',
                    labeltext: 'Specialization *',
                    validator: (value) => Validator().specislization(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validator().coursetype(value),
                      decoration: InputDecoration(
                        labelText: 'Course Type *',
                      ),
                      value: selectcoursetype,
                      items: coursetype.map((String course) {
                        return DropdownMenuItem<String>(
                          value: course,
                          child: Text(course),
                        );
                      }).toList(),
                      onChanged: (newvale) {
                        setState(() {
                          selectcoursetype = newvale;
                          coursetypecontroller.text = selectcoursetype!;
                        });
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: Text('Course Duration *'),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 150,
                          child: CustomTextFormField(
                            controller: coursestartingcontroller,
                            hintText: "",
                            labeltext: "Starting Year *",
                            validator: (value) =>
                                Validator().coursestating(value),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                          width: 150,
                          child: CustomTextFormField(
                            controller: courseendingcontroller,
                            hintText: "",
                            labeltext: "Ending Year *",
                            validator: (value) =>
                                Validator().courseending(value),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    
                    controller: gradingsystemcontroller,
                    hintText: '% Marks of 100 Maximum',
                    labeltext: 'Grading system *',
                    validator: (value) => Validator().grade(value),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          final usereducation = Usermodel(
                              course: coursecontroller.text,
                              courseStaringyear: coursestartingcontroller.text,
                              courseendingyear: courseendingcontroller.text,
                              coursetype: coursetypecontroller.text,
                              higereducation: higereducationcontroller.text,
                              grade: gradingsystemcontroller.text,
                              specialization: specializationcontroller.text,
                              universitynamecollegename:
                                  universityinstitutenamecontroller.text);
                          context.read<ProfileBloc>().add(Educationadd(
                              grade: usereducation.grade,
                              course: usereducation.course,
                              courseStaringyear:
                                  usereducation.courseStaringyear,
                              courseendingcontroller:
                                  usereducation.courseendingyear,
                              coursetype: usereducation.coursetype,
                              higereducation: usereducation.higereducation,
                              specialization: usereducation.specialization,
                              universityname:
                                  usereducation.universitynamecollegename));
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(' Education Successfully Updated '),
                              backgroundColor: Colors.green,
                            ));
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Future.delayed(Duration(seconds: 2), () {
                                context.read<ProfileBloc>().add(GetUserEvent());
                                Navigator.pop(context);
                              });
                            });
                          });
                        }
                      },
                      child: Text("Save"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
