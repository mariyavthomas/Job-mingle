import 'package:flutter/material.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

class Phone extends StatefulWidget {
  const Phone({
    super.key,
    required this.phonecontroller,
  });

  final TextEditingController phonecontroller;

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.phonecontroller,
      hintText: 'Phone Number',
      labeltext: 'Enter Phone Number',
      // enabledBorder: OutlineInputBorder(),
      // focusedBorder: OutlineInputBorder(),
    );
  }
}

