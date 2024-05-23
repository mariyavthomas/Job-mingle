import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';

import 'package:jobmingle/domin/models/user_model.dart';

class buttonregister extends StatelessWidget {
  const buttonregister({
    super.key,
    required this.loading,
    required TextEditingController fullnamecontroller,
    required TextEditingController emailController,
    required TextEditingController passwordcontroller,
    required TextEditingController phonenumbercontroller,
  })  : _fullnamecontroller = fullnamecontroller,
        _emailController = emailController,
        _passwordcontroller = passwordcontroller,
        _phonenumbercontroller = phonenumbercontroller;

  final TextEditingController _fullnamecontroller;
  final TextEditingController _emailController;
  final TextEditingController _passwordcontroller;
  final TextEditingController _phonenumbercontroller;
 final bool loading;
  @override
  Widget build(BuildContext context) {
    return 
    // loading ?
    // CircularProgressIndicator():
    InkResponse(
      onTap: () {
        Usermodel user = Usermodel(
            email: _emailController.text,
            password: _passwordcontroller.text,
            phone: _phonenumbercontroller.text,
            name: _fullnamecontroller.text);
        // _authbloc.add(SignupEvent(user:user));
        BlocProvider.of<LoginauthBloc>(context).add(SignUpEvent(user: user));
      },
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(200, 75, 110, 225),
        ),
        child: Center(
          child: Text(
            'Register',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
