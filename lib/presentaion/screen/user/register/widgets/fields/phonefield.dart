import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/fields/phonenumberfield.dart';



class Formfieldphonenumber extends StatelessWidget {
  const Formfieldphonenumber({
    super.key,
    required TextEditingController phonenumbercontroller,
  }) : _phonenumbercontroller = phonenumbercontroller;

  final TextEditingController _phonenumbercontroller;

  @override
  Widget build(BuildContext context) {
    return Phonefield(
      controller: _phonenumbercontroller,
      hintText: ' Phone number',
    );
  }
}
