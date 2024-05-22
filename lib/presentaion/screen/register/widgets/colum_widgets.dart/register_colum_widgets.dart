import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../button_widgets/buttoblogin.dart';
import '../button_widgets/buttonregister.dart';
import '../button_widgets/buttonwithgooge_widgets.dart';
import '../fields/emailfield.dart';
import '../fields/namefiled.dart';
import '../fields/passwordfield.dart';
import '../fields/phonefield.dart';

class registercolum extends StatelessWidget {
  const registercolum({
    super.key,required this.loading,
    required TextEditingController fullnamecontroller,
    required TextEditingController emailController,
    required TextEditingController passwordcontroller,
    required TextEditingController phonenumbercontroller,
  })  : _fullnamecontroller = fullnamecontroller,
        _emailController = emailController,
        _passwordcontroller = passwordcontroller,
        _phonenumbercontroller = phonenumbercontroller;

  final TextEditingController _fullnamecontroller;
  final TextEditingController _emailController;
  final TextEditingController _passwordcontroller;
  final TextEditingController _phonenumbercontroller;
   final bool loading;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start, children: [
      Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      Container(
        child: Lottie.asset('lib/assests/images/splash.json',
            height: 80, width: 200),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Create Your JobMingle Profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Register with Email',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            )),
      ),
      SizedBox(
        height: 10,
      ),
      Formfieldname(fullnamecontroller: _fullnamecontroller),
      Formfieldemail(emailController: _emailController),
      Formfieldpassword(passwordcontroller: _passwordcontroller),
      Formfieldphonenumber(phonenumbercontroller: _phonenumbercontroller),
      SizedBox(
        height: 30,
      ),
      buttonregister(
        loading:  loading,
        emailController: _emailController,fullnamecontroller: _fullnamecontroller,passwordcontroller: _passwordcontroller,phonenumbercontroller: _phonenumbercontroller),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(bottom: 10),
      //   child: Text('Or'),
      // ),
      //buttongoogle_widget(),
      buttonlogin()
    ]);
  }
}
