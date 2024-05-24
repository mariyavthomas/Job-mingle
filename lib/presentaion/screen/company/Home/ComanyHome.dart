import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_company/auth_company_bloc.dart';

class CompanyHomeScreen extends StatelessWidget {
  const CompanyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
 final authBloc = BlocProvider.of<AuthCompanyBloc>(context);
                authBloc.add(SignOutCompany());

                Navigator.pushNamedAndRemoveUntil(
                    context, '/Lcomp', (route) => false);
      
      }, icon: Icon(Icons.logout))]),
    );
  }
}