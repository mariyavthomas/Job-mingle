import 'package:flutter/material.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

class FormfieldCompanyname extends StatelessWidget {
  const FormfieldCompanyname({
    super.key,
    required TextEditingController fullnamecontroller,
  }) : _fullnamecontroller = fullnamecontroller;

  final TextEditingController _fullnamecontroller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        labeltext: 'Company Name',
        controller: _fullnamecontroller,
        hintText: "Company Name");
  }
}

