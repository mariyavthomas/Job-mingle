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

// ignore: must_be_immutable
class PersonalInfo extends StatefulWidget {
  PersonalInfo({super.key, required this.email, required this.phone,required this.dob,required this.gender,required this.language});

  String phone;
  String email;
  String dob;
  String language;
  String gender;

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
final  TextEditingController languagecontroller = TextEditingController();

  DateTime? _selectedDate;

  String _gender = '';
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    emailcontroller = TextEditingController(text: widget.email);
    phonecontroller = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.bluecolor(),
        title: Text("Personal Information"),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children:[ 
              SizedBox(height: 20),
            Email(emailcontroller: emailcontroller),
            SizedBox(height: 20),
            Phone(phonecontroller: phonecontroller),
            Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Text("Gender"),
            ),
            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: _gender,
              onChanged: (String? value) {
                setState(() {
                  _gender = value!;
                });
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
              },
            ),
            CustomTextFormField(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              controller: _dobController,
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
                    _dobController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  });
                }
              },
            ),
            SizedBox(height: 10),
            Language(languagecontroller: languagecontroller),
            Row(
              children: [
               Spacer(),
                SkipButton(),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          CustomColor.bluecolor())),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      final peronalinfo = Usermodel(
                        gender: _gender.toString(),
                        
                        dob: _dobController.text,
                        email: emailcontroller.text,
                        phone: phonecontroller.text,
                        language: languagecontroller.text,
                      );
                      context.read<PersoninfoBloc>().add(SavePersonalinfo(
                          dob: peronalinfo.dob,
                          email: peronalinfo.email,
                          gender: peronalinfo.gender,
                          language: peronalinfo.language,
                          phone: peronalinfo.phone));
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(' Profile Successfully Updated '),
                          backgroundColor: Colors.green,
                        ));
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.pop(context);
                          });
                        });
                      });
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),
         ] ),
        ),
      ),
    );
  }
}

