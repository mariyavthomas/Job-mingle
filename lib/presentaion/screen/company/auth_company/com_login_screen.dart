import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_company/auth_company_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/company/auth_company/login_company_wid.dart';

import 'package:jobmingle/presentaion/screen/user/login/login_widgets.dart';

class LoginPageCompany extends StatefulWidget {
  const LoginPageCompany({super.key});

  @override
  State<LoginPageCompany> createState() => _LoginPageCompanyState();
}

class _LoginPageCompanyState extends State<LoginPageCompany> {
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
   
    return BlocBuilder<AuthCompanyBloc, AuthCompanyState>(
        builder: (context, state) {
      if (state is AuthCompanyInitial) {
        loading = false;
      } else if (state is AuthCompanyLoading) {
        loading = true;
      } else if (state is Authenticatedcompany) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(context, '/CompanyHome', (route) => false);
          BlocProvider.of<AuthCompanyBloc>(context).add(LogingInitialcompanyEvent());
        });
      } else if (state is AuthenticatedErrorcomapny) {
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
            child: LoginComapny(
                loading: loading,
                emailController: _emailController,
                passwordcontroller: _passwordcontroller),
          ),
        )
      ]));
    });
  }
}
