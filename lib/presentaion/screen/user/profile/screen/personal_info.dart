import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/personlinfo/personinfo_bloc.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/peronaldetals/button/skipbutton.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/peronaldetals/field/email.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/peronaldetals/field/language.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/peronaldetals/field/phone.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';
import 'package:jobmingle/utils/validator.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo(
      {super.key,
      required this.address,
      required this.pincode,
      required this.hometown,
      required this.email,
      required this.phone,
      required this.dob,
      required this.gender,
      required this.language});

  String phone;
  String email;
  String dob;
  String language;
  String gender;
  String address;
  String pincode;
  String hometown;

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController languagecontroller = TextEditingController();
  TextEditingController addresscontroller =TextEditingController();
 TextEditingController hometowncontroller =TextEditingController();
 TextEditingController pincodecontroller=TextEditingController();

  DateTime? _selectedDate;
  String _gender = '';
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController(text: widget.email);
    phonecontroller = TextEditingController(text: widget.phone);
    dobController = TextEditingController(text: widget.dob);
    languagecontroller = TextEditingController(text: widget.gender);
    hometowncontroller= TextEditingController(text: widget.hometown);
    addresscontroller =TextEditingController(text:  widget.address);
    pincodecontroller =TextEditingController(text:widget.pincode );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.gender);
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back))),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Personal details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'This Information is important for employerv to know you better',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              Email(emailcontroller: emailcontroller),
              SizedBox(height: 20),
              Phone(phonecontroller: phonecontroller),
              Padding(
                padding: const EdgeInsets.only(right: 290),
                child: Text("Gender"),
              ),
              FormField<String>(
                validator:
                 (value) {
                  if (_gender.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
                builder: (FormFieldState<String> state) {
                  
                  return Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Male'),
                        value: 'Male',
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() {
                            _gender = value!;
                          });
                          state.didChange(value);
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Female'),
                        value: 'Female',
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() {
                            _gender = value!;
                          });
                          state.didChange(value);
                        },
                      ),
                      if (state.hasError)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            state.errorText ?? '',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              CustomTextFormField(
               
                controller: dobController,
                hintText: "Date Of Birth",
                readOnly: true,
                labeltext: 'Date Of Birth',
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      dobController.text =
                          "${pickedDate.toLocal()}".split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(height: 10),
              Language(languagecontroller: languagecontroller),
               SizedBox(height: 10),
             CustomTextFormField(
              enabledBorder: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
              controller: addresscontroller, hintText: "Enter Your address", labeltext: "Address",minlines: 5,maxlines: 5,),
              SizedBox(height: 10),
             CustomTextFormField(controller: hometowncontroller, hintText: "Enter the Home Town", labeltext: "Home Town"),
              SizedBox(height: 10),
             CustomTextFormField(controller: pincodecontroller, hintText: "Enter Pincode", labeltext: 'Pincode'),
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  SkipButton(),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(CustomColor.bluecolor()),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final personalinfo = Usermodel(
                          gender: _gender.toString(),
                          dob: dobController.text,
                          email: emailcontroller.text,
                          phone: phonecontroller.text,
                          language: languagecontroller.text,
                          address: addresscontroller.text,
                          pincode: pincodecontroller.text,
                          hometown: hometowncontroller.text
                        );
                        context.read<PersoninfoBloc>().add(
                              SavePersonalinfo(
                                dob: personalinfo.dob,
                                email: personalinfo.email,
                                gender: personalinfo.gender,
                                language: personalinfo.language,
                                phone: personalinfo.phone,
                                address: personalinfo.address,
                                hometown: personalinfo.hometown,
                                pincode: personalinfo.pincode
                              ),
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Profile Successfully Updated'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pop(context);
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
    );
  }
}
