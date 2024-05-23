import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';

import 'package:jobmingle/presentaion/screen/user/login/login_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<LoginauthBloc, LoginauthState>(
        builder: (context, state) {
      if (state is LoginauthInitialstate) {
        loading = false;
      } else if (state is Authloading) {
        loading = true;
      } else if (state is Authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          BlocProvider.of<LoginauthBloc>(context).add(LogingInitialEvent());
        });
      } else if (state is AuthenticatedError) {
        // return ScaffoldMessenger.of(context).showSnackBar(
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
            ),
            backgroundColor: Colors.red,
          ));
        });
      }
      return Scaffold(
          body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: double.infinity,
            width: double.infinity,
            child: logincolum(
                loading: loading,
                emailController: _emailController,
                passwordcontroller: _passwordcontroller),
          ),
        )
      ]));
    });
  }
}
