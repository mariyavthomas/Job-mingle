import 'package:flutter/material.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

class Formfieldemail extends StatelessWidget {
  const Formfieldemail({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        labeltext: 'Email ID',
        controller: _emailController,
        hintText: "Email ID");
  }
}