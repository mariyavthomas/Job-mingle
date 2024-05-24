import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/company/register/fields/Companyname.dart';
import 'package:jobmingle/presentaion/screen/company/register/widgets/buttonlogin.dart';
import 'package:jobmingle/presentaion/screen/company/register/widgets/buttonregister.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/button_widgets/buttoblogin.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/button_widgets/buttonregister.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/fields/emailfield.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/fields/namefiled.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/fields/passwordfield.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/fields/phonefield.dart';
import 'package:lottie/lottie.dart';


class registerCompanycolum extends StatelessWidget {
  const registerCompanycolum({
    Key ?key,
    required this.loading,
    required TextEditingController companynamecontroller,
    required TextEditingController companyemailController,
    required TextEditingController companypasswordcontroller,
    required TextEditingController companyphonenumbercontroller,
  })  : _companynamecontroller = companynamecontroller,
        _companyemailController = companyemailController,
        _companypasswordcontroller =companypasswordcontroller,
        _companyphonenumbercontroller = companyphonenumbercontroller,
        super(key:key);
        

  final TextEditingController _companynamecontroller;
  final TextEditingController _companyemailController;
  final TextEditingController _companypasswordcontroller;
  // ignore: unused_field
  final TextEditingController _companyphonenumbercontroller;
   final bool loading;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start, children: [
      Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      Container(
        child: Lottie.asset('lib/assests/images/splash.json',
            height: 80, width: 200),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Create Your JobMingle Profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Register with Email',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            )),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormfieldCompanyname(fullnamecontroller: _companynamecontroller),
      ),
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Formfieldemail(emailController: _companyemailController),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Formfieldpassword(passwordcontroller: _companypasswordcontroller),
      ),
      Formfieldphonenumber(phonenumbercontroller: _companyphonenumbercontroller),
      SizedBox(
        height: 10,
      ),
      ButtonCompnyregister(
        loading:  loading,
        companyemailController: _companyemailController,fullcompanynamecontroller: _companynamecontroller,companypasswordcontroller: _companypasswordcontroller,companyphonenumbercontroller: _companyphonenumbercontroller),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(bottom: 10),
      //   child: Text('Or'),
      // ),
      //buttongoogle_widget(),
      Buttonlogincompany(),
    ]);
  }
}
