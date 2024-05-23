import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phonefield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const Phonefield({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  State<Phonefield> createState() => _PhonefieldState();
}

class _PhonefieldState extends State<Phonefield> {
  //final TextEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntlPhoneField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black)),
          labelText: "Phone Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          prefixIcon: Text("+"),
        ),
        initialCountryCode: 'IN',
        onChanged: (value) {},
      ),
    );
  }
}
