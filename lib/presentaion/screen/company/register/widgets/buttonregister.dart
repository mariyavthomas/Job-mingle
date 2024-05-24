import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_company/auth_company_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/domin/models/company_model.dart';

import 'package:jobmingle/domin/models/user_model.dart';

class ButtonCompnyregister extends StatelessWidget {
  const ButtonCompnyregister({
    super.key,
    required this.loading,
    required TextEditingController fullcompanynamecontroller,
    required TextEditingController companyemailController,
    required TextEditingController companypasswordcontroller,
    required TextEditingController companyphonenumbercontroller,
  })  : _fullcompanynamecontroller = fullcompanynamecontroller,
        _companyemailController = companyemailController,
        _companypasswordcontroller = companypasswordcontroller,
        _companyphonenumbercontroller = companyphonenumbercontroller;

  final TextEditingController _fullcompanynamecontroller;
  final TextEditingController _companyemailController;
  final TextEditingController _companypasswordcontroller;
  final TextEditingController _companyphonenumbercontroller;
 final bool loading;
  @override
  Widget build(BuildContext context) {
    return 
    // loading ?
    // CircularProgressIndicator():
    InkResponse(
      onTap: () {
        Companymodel comapny = Companymodel(

           companyemail: _companyemailController.text,
           companyname: _fullcompanynamecontroller.text,
           companypassword: _companypasswordcontroller.text,
           phone: _companyphonenumbercontroller.text
            );
        // _authbloc.add(SignupEvent(user:user));
        BlocProvider.of<AuthCompanyBloc>(context).add(SignUpCompany(company: comapny));
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
