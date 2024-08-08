import 'package:flutter/material.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

class Language extends StatefulWidget {
  const Language({
    super.key,
    required this.languagecontroller,
  });

  final TextEditingController languagecontroller;

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      // enabledBorder: OutlineInputBorder(),
      // focusedBorder: OutlineInputBorder(),
      controller: widget.languagecontroller,
      hintText: "Language",
      labeltext: "Known Language",

    );
  }
}

