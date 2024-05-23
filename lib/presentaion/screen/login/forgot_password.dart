import 'package:flutter/material.dart';
import 'package:jobmingle/infrastructure/helper_class/userrep/resetrepo.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';

// ignore: must_be_immutable
class Forgotpassword extends StatelessWidget {
  Forgotpassword({super.key});
  TextEditingController _emailController = TextEditingController();
  ResetPassRespo pass = ResetPassRespo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Color.fromARGB(200, 75, 110, 225),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter Your email and we will send you a password',
              textAlign: TextAlign.center,
            ),
          ),
          CustomTextFormField(
              labeltext: 'Email ID',
              controller: _emailController,
              hintText: "Enter the Email"),
          MaterialButton(
            onPressed: () {
              pass.resetPassword(context, _emailController.text);
            },
            child: Text('Reset password'),
            color: Color.fromARGB(200, 75, 110, 225),
          )
        ],
      ),
    );
  }
}
