import 'package:flutter/material.dart';
import 'package:jobmingle/infrastructure/Repo/resetrepo.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';
import 'package:jobmingle/utils/validator.dart';

// ignore: must_be_immutable
class Forgotpassword extends StatelessWidget {
  Forgotpassword({super.key});
  TextEditingController _emailController = TextEditingController();
  ResetPassRespo pass = ResetPassRespo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Forgot Password',style: TextStyle(color: Colors.black),),
        backgroundColor:Colors.white,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              
              validator: (value) => Validator().emailValidator(value),
                labeltext: 'Email ID',
                controller: _emailController,
                hintText: "Enter the Email"),
          ),
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
