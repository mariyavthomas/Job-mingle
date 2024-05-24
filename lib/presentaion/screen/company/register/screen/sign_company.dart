import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_company/auth_company_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/company/register/widgets/registercolum.dart';




class RegisterPageCompany extends StatefulWidget {
  RegisterPageCompany({super.key});
  @override
  State<RegisterPageCompany> createState() => _RegisterPageCompanyState();
}

class _RegisterPageCompanyState extends State<RegisterPageCompany> {
  TextEditingController _companyemailController = TextEditingController();
  TextEditingController _companypasswordcontroller = TextEditingController();
  TextEditingController _companynamecontroller = TextEditingController();
  TextEditingController _companyphonenumbercontroller = TextEditingController();

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordcontroller.dispose();
  //   super.dispose();
  // }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCompanyBloc, AuthCompanyState>(
        builder: (context, state) {
      if (state is LoginauthInitialstate) {
        loading = false;
      }
      if (state is AuthCompanyLoading) {
        loading = true;
      }
      if (state is AuthenticatedErrorcomapny) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.message),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        BlocProvider.of<LoginauthBloc>(context)
                            .add(LogingInitialEvent());
                      },
                      child: Text('ok'))
                ],
              );
            },
          );
        });
      }

      if (state is Authenticatedcompany) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Successfully Registered'),
            backgroundColor: Colors.green,
          ));
        });
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/onboarding', (route) => false);
        });
      }
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: registerCompanycolum (
                      loading: loading,
                      companynamecontroller: _companynamecontroller,
                      companyemailController: _companyemailController,
                      companypasswordcontroller: _companypasswordcontroller,
                      companyphonenumbercontroller: _companyphonenumbercontroller),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
