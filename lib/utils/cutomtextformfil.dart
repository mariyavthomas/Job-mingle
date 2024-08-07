import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final TextStyle? hintstyle;

  final String hintText;
  final bool obscureText;

  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? errorStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final type;
  final  String? counterText;
  final TextStyle? style;
  final maxlines;
  final minlines;
  final String labeltext;
  final FormFieldValidator<String>? validator;
  final onTap;
  CustomTextFormField({
    Key? key,
   // this.borderside,
   this.onTap,
    this.hintstyle,
    this.counterText,
    this.validator,
    this.errorStyle,
    this.minlines,
    this.readOnly =false,
    this.style,
    required this.controller,
    this.maxlines,
    this.type = TextInputType.text,
    required this.hintText,
    this.obscureText = false,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixIcon,
    this.suffixIcon,
    required this.labeltext,
  }) : super(key: key);

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginauthBloc, LoginauthState>(
      builder: (context, state) {
        if (state is ObsecureState) {
          _obscureText = state.obscure;
        }
        return Column(
          children: [
            TextFormField(
            // readOnly: readOnly,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: maxlines,
              keyboardType: type,
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: labeltext,
                errorStyle: TextStyle(color: Colors.red),
                hintStyle: Theme.of(context).textTheme.bodySmall,
                hintText: hintText,
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                 
                prefixIcon: prefixIcon,
                suffixIcon: obscureText
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                            : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          BlocProvider.of<LoginauthBloc>(context)
                              .add(ObsecuretextEvent(obscure: _obscureText));
                        },
                      )
                    : suffixIcon,
              ),
              onTap: onTap,
              obscureText: obscureText && _obscureText,
              validator:validator,
              readOnly: readOnly,
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}
