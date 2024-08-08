import 'package:flutter/material.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';
import 'package:jobmingle/utils/validator.dart';

class Email extends StatefulWidget {
  const Email({
    super.key,
    required this.emailcontroller,
  });

  final TextEditingController emailcontroller;

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) => Validator().emailValidator(value),
      // enabledBorder: OutlineInputBorder(),
      // focusedBorder: OutlineInputBorder(),
      controller: widget.emailcontroller,
      hintText: 'Email',
      labeltext: "Enter the Email",
    );
  }
}
