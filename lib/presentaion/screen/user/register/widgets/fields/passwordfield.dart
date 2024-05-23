import 'package:flutter/material.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

class Formfieldpassword extends StatelessWidget {
  const Formfieldpassword({
    super.key,
    required TextEditingController passwordcontroller,
  }) : _passwordcontroller = passwordcontroller;

  final TextEditingController _passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        labeltext: 'Password',
        obscureText: true,
        controller: _passwordcontroller,
        hintText: "Password");
  }
}