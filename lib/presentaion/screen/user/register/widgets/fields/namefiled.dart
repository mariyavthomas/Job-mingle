import 'package:flutter/material.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

class Formfieldname extends StatelessWidget {
  const Formfieldname({
    super.key,
    required TextEditingController fullnamecontroller,
  }) : _fullnamecontroller = fullnamecontroller;

  final TextEditingController _fullnamecontroller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        labeltext: 'Full Name',
        controller: _fullnamecontroller,
        hintText: "Full Name");
  }
}

